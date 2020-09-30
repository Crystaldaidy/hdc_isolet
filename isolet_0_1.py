import numpy as np
import heterocl as hcl
import pickle

source = 'isolet.pkl'
with open(source, 'rb') as f:
    isolet = pickle.load(f)
trainData, trainLabels, testData, testLabels = isolet
trainLabels = np.array(trainLabels)
testLabels = np.array(testLabels)

numClasses = 26
quantLevels = 100
dim = 10000

hdTrainData = np.load("hdTrainData.npy")
hdTestData = np.load("hdTestData.npy")

bw = 100

###The top training function
def kernel(trainData, trainLabels, testData, testLabels, itemMem, idMem, rdv1, rdv2, rdv3, epoch):
    def learn(k,hdTrainData, prototype, prototypeCounter):
        match = hcl.compute(hdTrainData.shape, lambda x,y: 
                hcl.select(trainLabels[x] == k, hdTrainData[x][y], 0), "match")
        with hcl.for_(0,hdTrainData.shape[0]) as a:
            with hcl.if_(trainLabels[a] == k):
                max[k] += 1
        r = hcl.reduce_axis(0, trainData.shape[0], 'r')
        result = hcl.compute((dim,), lambda y: hcl.sum(match[r][y], axis=r), "result")
        sum1 = hcl.compute((dim,), lambda x: 0, "sum1")
        with hcl.if_(max[k] % 2 == 0):
            hcl.update(sum1, lambda x: hcl.select(result[x] + rdv3[k][x] - max[k]/2 > 0, 1, 0))
        with hcl.else_():
            hcl.update(sum1, lambda x: hcl.select(result[x] - max[k]/2 > 0, 1, 0))
        with hcl.for_(0, dim) as t:
            prototype[k][t] = sum1[t]
            prototypeCounter[k][t] = result[t]

    def test_hdc_accu(proto, hyper_dataset, labels, type):
        correct1 = hcl.scalar(0, 'correct1')
        m1 = hcl.reduce_axis(0, hyper_dataset.shape[1], "m1")
        hamming_dist1 = hcl.compute((numClasses,), lambda x: 0, "hamming_dist1")
        with hcl.for_(0, hyper_dataset.shape[0]) as i:
            with hcl.for_(0, numClasses) as n:
                distance1 = hcl.compute((hyper_dataset.shape[1],), 
                                lambda x: hyper_dataset[i][x] ^ proto[n][x], 'distance1')
                hamming_dist1[n] = hcl.sum(distance1[m1], axis=m1)
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

    def update(l, prototype, prototypeCounter, max):
        hcl.print((l+1),"%d:Use hard examples to update the prototype counters.\n")
        dist = hcl.compute((numClasses,), lambda x: 0, "dist")
        m = hcl.reduce_axis(0, hdTrainData.shape[1], "m")
        with hcl.for_(0, hdTrainData.shape[0]) as i:
            with hcl.for_(0, numClasses) as n:
                distance = hcl.compute((hdTrainData.shape[1],), 
                                lambda x: hdTrainData[i][x] ^ prototype[n][x], 'distance')
                dist[n] = hcl.sum(distance[m], axis=m)
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
                    
        hcl.mutate((1,), lambda x: test_hdc_accu(prototype, hdTrainData, trainLabels, 1), 'training_update')
        hcl.mutate((1,), lambda x: test_hdc_accu(prototype, hdTestData, testLabels, 2), 'testing_update')

    #learn
    hcl.print((),"Learning the prototype HDVs.\n")
    prototype = hcl.compute((numClasses, dim), lambda x, y: 0, "prototype")
    prototypeCounter = hcl.compute((numClasses, dim), lambda x, y: 0, "prototypeCounter")

    max = hcl.compute((numClasses, ), lambda x: 0)
    hcl.mutate((numClasses,), lambda k: learn(k, hdTrainData, prototype, prototypeCounter),"learn")

    hcl.mutate((1,), lambda x: test_hdc_accu(prototype, hdTrainData, trainLabels, 1),"test_train_accu")
    hcl.mutate((1,), lambda x: test_hdc_accu(prototype, hdTestData, testLabels, 2),"test_test_accu")

    #update
    hcl.mutate((epoch[0],), lambda x: update(x, prototype, prototypeCounter, max),"update")

hcl.init()

hcl_trainData = hcl.placeholder((trainData.shape),"hcl_trainData")
hcl_trainLabels = hcl.placeholder((trainLabels.shape),"hcl_trainLabels")
hcl_testData = hcl.placeholder((testData.shape),"hcl_testData")
hcl_testLabels = hcl.placeholder((testLabels.shape),"hcl_testLabels")
hcl_rdv3 = hcl.placeholder((numClasses,dim),"hcl_rdv3")
hcl_epoch = hcl.placeholder((1,),"hcl_epoch")

s = hcl.create_schedule([hcl_trainData, hcl_trainLabels, hcl_testData, hcl_testLabels,hcl_rdv3, hcl_epoch], kernel)

# print(hcl.lower(s))
f = hcl.build(s)

_trainData = hcl.asarray(hdTrainData)
_trainLabels = hcl.asarray(trainLabels)
_testData = hcl.asarray(hdTestData)
_testLabels = hcl.asarray(testLabels)
_rdv3 = hcl.asarray(np.random.choice([0,1], size=(numClasses, dim)))
_epoch = hcl.asarray([30])

f(_trainData, _trainLabels, _testData, _testLabels, _rdv3, _epoch)
