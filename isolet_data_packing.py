import numpy as np
import heterocl as hcl
import pickle
import hdc


def dataset(source):
    with open(source, 'rb') as f:
        isolet = pickle.load(f)
    trainData, trainLabels, testData, testLabels = isolet
    return np.array(trainData), np.array(trainLabels), np.array(testData), np.array(testLabels)

def quant(x, numBins, xTest=None):
    """
    return which quantization level each elements in x belongs to
    """
    min, max = np.amin(x), np.amax(x)
    q = (max-min)*1.0/(numBins-1)
    # if we want quantized values, return q * np.round((x-min)/q) + min
    if xTest is None:
        return np.round((x-min)/q).astype(int)
    else:
        return np.round((x-min)/q).astype(int), np.round((xTest-min)/q).astype(int)

def linearItemMem(dim, num):
    assert num>1, "No need of this function if only one vector in the item memory."
    item_mem = np.zeros([num, dim], dtype='int')
    item_mem[0] = np.random.choice([0,1], size=dim)
    # generate the rest of the pixels based on the absolute distances among pixels.
    index = np.arange(dim//2)
    np.random.shuffle(index)
    print("generate hyper vectors")
    interval = int((dim/2)/(num-1))
    pointer = 0
    for i in range(1,num):
        new_item = np.copy(item_mem[i-1])
        if i == num-1:
            new_item[index[pointer:]] -= 1
            new_item[index[pointer:]] *= -1
        else:
            new_item[index[pointer: pointer+interval]] -= 1
            new_item[index[pointer: pointer+interval]] *= -1
        pointer += interval
        item_mem[i] = new_item
    return np.array(item_mem)

def preprocessing(dataset, numClasses, quantLevels, dim):
    trainData, trainLabels, testData, testLabels = dataset
    trainData, testData = quant(trainData, quantLevels, testData)
    itemMem = linearItemMem(dim, quantLevels)
    idMem = np.random.choice([0,1], size=(trainData.shape[1], dim)) #representation of pixels
    return trainData, trainLabels, testData, testLabels, itemMem, idMem

numClasses = 26
quantLevels = 100
dim = 10000
source = '/home/dnd29/hyperdimensional-computing/dataset/isolet/isolet.pkl'
isolet = dataset(source)

trainData, trainLabels, testData, testLabels, itemMem, idMem = preprocessing(isolet, numClasses, quantLevels, dim)

###The top training function
def kernel(trainData, trainLabels, testData, testLabels, itemMem, idMem, rdv1, rdv2, rdv3, epoch):
    # pack_rdv1 = hcl.pack(rdv1, dtype=hcl.UInt(128))
    # pack_rdv2 = hcl.pack(rdv2, dtype=hcl.UInt(128))
    # pack_rdv3 = hcl.pack(hcl_rdv3, dtype=hcl.UInt(128))

    def learn(k, hdTrainData, prototype, prototypeCounter):
        match = hcl.compute(hdTrainData.shape, 
                        lambda x,y: hcl.select(trainLabels[x] == k, hdTrainData[x][y], 0), "match")
        with hcl.for_(0,hdTrainData.shape[0]) as a:
            with hcl.if_(trainLabels[a] == k):
                max[k] += 1
        r = hcl.reduce_axis(0, hdTrainData.shape[0], 'r')
        # #calculate the sum of '1' of every packed number
        # pre_result = hcl.compute(hdTrainData.shape, lambda x,y: sum_of_one(match[x][y]), "pre_result")
        result = hcl.compute((hdTrainData.shape[1],), lambda y: hcl.sum(match[r][y], axis=r), "result")
        sum1 = hcl.compute((hdTrainData.shape[1],), lambda x: 0, "sum1")
        with hcl.if_(max[k] % 2 == 0):
            hcl.update(sum1, lambda x: hcl.select(result[x] + rdv3[k][x] - max[k]/2 > 0, 1, 0))
        with hcl.else_():
            hcl.update(sum1, lambda x: hcl.select(result[x] - max[k]/2 > 0, 1, 0))
        with hcl.for_(0, dim) as t:
            prototype[k][t] = sum1[t]
            prototypeCounter[k][t] = result[t]

    def sum_of_one(value):
        count = hcl.scalar(0)
        with hcl.while_(value > 0):
            hcl.print((value),"%d\n")
            count.v += value & 1
            value >> 1
        return count.v

    def test_hdc_accu(proto, hyper_dataset, labels, type):
        correct1 = hcl.scalar(0, 'correct1')
        m1 = hcl.reduce_axis(0, hyper_dataset.shape[1], "m1")
        hamming_dist1 = hcl.compute((numClasses,), lambda x: 0, "hamming_dist1")
        with hcl.for_(0, hyper_dataset.shape[0]) as i:
            with hcl.for_(0, numClasses) as n:
                hcl.print(())
                distance1 = hcl.compute((hyper_dataset.shape[1],), 
                                lambda x: hyper_dataset[i][x] ^ proto[n][x], 'distance1', dtype=hcl.UInt(128))
                #calculate the sum of '1' of every packed number  
                pre_hamming = hcl.compute((hyper_dataset.shape[1],), lambda x: sum_of_one(distance1[x]), "pre_hamming")
                hamming_dist1[n] = hcl.sum(pre_hamming[m1], axis=m1)
            pred1 = hcl.scalar(0, 'pred1')
            with hcl.for_(0, hamming_dist1.shape[0]) as j:
                with hcl.if_(hamming_dist1[j] < hamming_dist1[pred1]):
                    pred1.v = j
            with hcl.if_(pred1.v == labels[i]):
                correct1.v += 1
        all1 = hcl.scalar(hyper_dataset.shape[0], "all1", dtype = hcl.Float(32))
        accuracy1 = hcl.compute((1,), lambda x: correct1.v/all1.v*100, "accuracy1" , dtype = hcl.Float(32))
        with hcl.if_(type == 1):
            hcl.print((correct1, hyper_dataset.shape[0], accuracy1[0]), "Training accu: %d/%d (%.2f%%)\n")
        with hcl.else_():
            hcl.print((correct1, hyper_dataset.shape[0], accuracy1[0]), "Testing accu: %d/%d (%.2f%%)\n")

    def update(l, prototype, pack_proto, prototypeCounter, max):
        hcl.print((l+1),"%d:Use hard examples to update the prototype counters.\n")
        dist = hcl.compute((numClasses,), lambda x: 0, "dist")
        m = hcl.reduce_axis(0, pack_traindata.shape[1], "m")
        with hcl.for_(0, pack_traindata.shape[0]) as i:
            with hcl.for_(0, numClasses) as n:
                distance = hcl.compute((pack_traindata.shape[1],), 
                                lambda x: pack_traindata[i][x] ^ pack_proto[n][x], 'distance', dtype=hcl.UInt(128))
                #calculate the sum of '1' of every packed number
                pre_dist = hcl.compute((pack_traindata.shape[1],), lambda x: sum_of_one(distance[x]), "pre_dist")
                dist[n] = hcl.sum(pre_dist[m], axis=m)
            pred = hcl.scalar(0, 'pred')
            with hcl.for_(0, dist.shape[0]) as j:
                with hcl.if_(dist[j] < dist[pred]):
                    pred.v = j

            with hcl.if_(pred.v != trainLabels[i]):
                max[trainLabels[i]] += 1
                max[pred] -= 1
                with hcl.for_(0, dim) as m:
                    prototypeCounter[trainLabels[i]][m] += hdTrainData[i][m]
                    prototypeCounter[pred][m] -= hdTrainData[i][m]
                    with hcl.if_(max[trainLabels[i]] % 2 == 0):
                        with hcl.if_(prototypeCounter[trainLabels[i]][m] - max[trainLabels[i]]/2 == 0):
                            prototype[trainLabels[i]][m] -= 1
                            prototype[trainLabels[i]][m] *= -1
                    with hcl.else_():
                        prototype[trainLabels[i]][m] = hcl.select(prototypeCounter[trainLabels[i]][m] - max[trainLabels[i]]/2 > 0, 1, 0)

                    with hcl.if_(max[pred] % 2 == 0):
                        with hcl.if_(prototypeCounter[pred][m] - max[pred]/2 == 0):
                            prototype[pred][m] -= 1
                            prototype[pred][m] *= -1
                    with hcl.else_():
                        prototype[pred][m] = hcl.select(prototypeCounter[pred][m] - max[pred]/2 > 0, 1, 0)
            pack_proto = hcl.pack(prototype, axis = 1, dtype=hcl.UInt(128))

        hcl.mutate((1,), lambda x: test_hdc_accu(prototype, hdTrainData, trainLabels, 1), 'training_update')
        hcl.mutate((1,), lambda x: test_hdc_accu(prototype, hdTestData, testLabels, 2), 'testing_update')

    def train_encoding(m, preTrainData):
        train_temp = hcl.compute((trainData.shape[1], dim), lambda x, y: itemMem[trainData[m][x]][y] ^ idMem[x][y], name = "train_temp")
        k1 = hcl.reduce_axis(0, trainData.shape[1], 'k1')
        train_result = hcl.compute((dim,), lambda x: hcl.sum(train_temp[k1, x], axis = k1, dtype=hcl.Int()), name = "train_result")
        with hcl.for_(0, dim) as n:
            preTrainData[m][n] = train_result[n]
        with hcl.if_((m + 1) % 1000 == 0):
            hcl.print((m+1), "Finish encoding %d training data\n")

    def test_encoding(m, preTestData):
        test_temp = hcl.compute((testData.shape[1], dim), lambda x, y: itemMem[testData[m][x]][y] ^ idMem[x][y], name = "test_temp")
        k2 = hcl.reduce_axis(0, testData.shape[1], 'k2')
        test_result = hcl.compute((dim,), lambda x: hcl.sum(test_temp[k2, x], axis = k2, dtype=hcl.Int()), name = "test_result")
        with hcl.for_(0, dim) as n:
            preTestData[m][n] = test_result[n]
        with hcl.if_((m + 1) % 100 == 0):
            hcl.print((m+1), "Finish encoding %d testing data\n")

    #Encoding
    hcl.print((), "Encoding the training data into HDVs.\n")
    preTrainData = hcl.compute((trainData.shape[0], dim), lambda x, y: 0, "preTrainData")
    hcl.mutate((trainData.shape[0], ), lambda x: train_encoding(x, preTrainData))

    hdTrainData = hcl.compute((trainData.shape[0], dim), lambda x, y: 0, "hdTrainData")
    with hcl.if_(trainData.shape[1] % 2 == 0):
        hcl.print((), "Use the random vector\n")
        hcl.update(hdTrainData, lambda x, y: hcl.select(preTrainData[x][y] + rdv1[x][y] - trainData.shape[1] / 2 > 0, 1, 0))
    with hcl.else_():
        hcl.update(hdTrainData, lambda x, y: hcl.select(preTrainData[x][y] - trainData.shape[1] / 2 > 0, 1, 0))
    pack_traindata = hcl.pack(hdTrainData, axis = 1, dtype=hcl.UInt(128))
    pack_dim = pack_traindata.shape[1]


    hcl.print((),"Encoding the testing data into HDVs.\n")
    preTestData = hcl.compute((testData.shape[0], dim), lambda x, y: 0, "preTestData")
    hcl.mutate((testData.shape[0], ), lambda x: test_encoding(x, preTestData))

    hdTestData = hcl.compute((testData.shape[0], dim), lambda x, y: 0, "hdTestData")
    with hcl.if_(testData.shape[1] % 2 == 0):
        hcl.print((), "Use the random vector\n")
        hcl.update(hdTestData, lambda x, y: hcl.select(preTestData[x][y] + rdv2[x][y] - testData.shape[1] / 2 > 0, 1, 0))
    with hcl.else_():
        hcl.update(hdTestData, lambda x, y: hcl.select(preTestData[x][y] - testData.shape[1] / 2 > 0, 1, 0))
    pack_testdata = hcl.pack(hdTestData, axis = 1, dtype=hcl.UInt(128))


    #learn
    hcl.print((),"Learning the prototype HDVs.\n")
    prototype = hcl.compute((numClasses, dim), lambda x, y: 0, "prototype",)
    prototypeCounter = hcl.compute((numClasses, dim), lambda x, y: 0, "prototypeCounter") #Every dimension is the sum of the targeted data

    max = hcl.compute((numClasses, ), lambda x: 0)
    hcl.mutate((numClasses,), lambda k: learn(k, hdTrainData, prototype, prototypeCounter),"learn")
    pack_proto = hcl.pack(prototype, dtype=hcl.UInt(128))
    hcl.mutate((1,), lambda x: test_hdc_accu(pack_proto, pack_traindata, trainLabels, 1),"test_train_accu")
    hcl.mutate((1,), lambda x: test_hdc_accu(pack_proto, pack_testdata, testLabels, 2),"test_test_accu")

    #update
    hcl.mutate((epoch[0],), lambda x: update(x, prototype, pack_proto, prototypeCounter, max),"update")

hcl.init()

hcl_trainData = hcl.placeholder((trainData.shape),"hcl_trainData")
hcl_trainLabels = hcl.placeholder((trainLabels.shape),"hcl_trainLabels")
hcl_testData = hcl.placeholder((testData.shape),"hcl_testData")
hcl_testLabels = hcl.placeholder((testLabels.shape),"hcl_testLabels")
hcl_itemMem = hcl.placeholder((itemMem.shape),"hcl_itemMem")
hcl_idMem = hcl.placeholder((idMem.shape),"hcl_idMem")
hcl_rdv1 = hcl.placeholder((trainData.shape[0],dim),"hcl_rdv1")
hcl_rdv2 = hcl.placeholder((testData.shape[0],dim),"hcl_rdv2")
hcl_rdv3 = hcl.placeholder((numClasses,dim),"hcl_rdv3")
hcl_epoch = hcl.placeholder((1,),"hcl_epoch")

s = hcl.create_schedule([hcl_trainData, hcl_trainLabels, hcl_testData, hcl_testLabels, hcl_itemMem, hcl_idMem, hcl_rdv1, hcl_rdv2, hcl_rdv3, hcl_epoch], kernel)

# print(hcl.lower(s))
f = hcl.build(s)



_trainData = hcl.asarray(trainData)
_trainLabels = hcl.asarray(trainLabels)
_testData = hcl.asarray(testData)
_testLabels = hcl.asarray(testLabels)
_itemMem = hcl.asarray(itemMem)
_idMem = hcl.asarray(idMem)
_rdv1 = hcl.asarray(np.random.choice([0,1], size=(trainData.shape[0], dim)))
_rdv2 = hcl.asarray(np.random.choice([0,1], size=(testData.shape[0], dim)))
_rdv3 = hcl.asarray(np.random.choice([0,1], size=(numClasses, dim)))
_epoch = hcl.asarray([30])

f(_trainData, _trainLabels, _testData, _testLabels, _itemMem, _idMem, _rdv1, _rdv2, _rdv3, _epoch)
