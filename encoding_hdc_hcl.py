import numpy as np
import heterocl as hcl
import pickle
import time


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
isolet = dataset('isolet.pkl')

start1 = time.time()
trainData, trainLabels, testData, testLabels, itemMem, idMem = preprocessing(isolet, numClasses, quantLevels, dim)
end1 = time.time()

def kernel(trainData, testData, itemMem, idMem, rdv1, rdv2):
    def train_encoding(m, preTrainData):
        train_temp = hcl.compute((trainData.shape[1], dim), lambda x, y: itemMem[trainData[m][x]][y] ^ idMem[x][y], name = "train_temp")
        k1 = hcl.reduce_axis(0, trainData.shape[1], 'k1')
        train_result = hcl.compute((dim,), lambda x: hcl.sum(train_temp[k1, x], axis = k1, dtype=hcl.Int()), name = "train_result")
        with hcl.for_(0, dim) as n:
            preTrainData[m][n] = train_result[n]
        with hcl.if_((m + 1) % 1000 == 0):
            hcl.print((m+1), "Finish encoding %d training data\n")

    def test_encoding(m, preTestData):
        test_temp = hcl.compute((testData.shape[1], dim), lambda x, y: itemMem[testData[m][x]][y]^idMem[x][y], name = "test_temp")
        k2 = hcl.reduce_axis(0, testData.shape[1], 'k2')
        test_result = hcl.compute((dim,), lambda x: hcl.sum(test_temp[k2, x], axis = k2, dtype=hcl.Int()), name = "test_result")
        with hcl.for_(0, dim) as n:
            preTestData[m][n] = test_result[n]
        with hcl.if_((m+1)%100 == 0):
            hcl.print((m+1), "Finish encoding %d testing data\n")

    #Encoding
    hcl.print((), "Encoding the training data into HDVs.\n")
    preTrainData = hcl.compute((trainData.shape[0], dim), lambda x, y: 0, "preTrainData")
    hcl.mutate((trainData.shape[0], ), lambda x: train_encoding(x, preTrainData))

    hdTrainData = hcl.compute((trainData.shape[0], dim), lambda x, y: 0, "hdTrainData")
    with hcl.Stage("S1"):
        with hcl.if_(trainData.shape[1] % 2 == 0):
            hcl.print((), "Use the random vector\n")
            hcl.update(hdTrainData, lambda x, y: hcl.select(preTrainData[x][y] + rdv1[x][y] - trainData.shape[1]/2 > 0, 1, 0))
        with hcl.else_():
            hcl.update(hdTrainData, lambda x, y: hcl.select(preTrainData[x][y] - trainData.shape[1]/2 > 0, 1, 0))

    hcl.print((),"Encoding the testing data into HDVs.\n")
    preTestData = hcl.compute((testData.shape[0], dim), lambda x, y: 0, "preTestData")
    hcl.mutate((testData.shape[0], ), lambda x: test_encoding(x, preTestData))

    hdTestData = hcl.compute((testData.shape[0], dim), lambda x, y: 0, "hdTestData")
    with hcl.Stage("S2"):
        with hcl.if_(testData.shape[1] % 2 == 0):
            hcl.print((), "Use the random vector\n")
            hcl.update(hdTestData, lambda x, y: hcl.select(preTestData[x][y] + rdv2[x][y] - testData.shape[1]/2 > 0, 1, 0))
        with hcl.else_():
            hcl.update(hdTestData, lambda x, y: hcl.select(preTestData[x][y] - testData.shape[1]/2 > 0, 1, 0))
    return hdTrainData, hdTestData

hcl_trainData = hcl.placeholder((trainData.shape),"hcl_trainData")
hcl_testData = hcl.placeholder((testData.shape),"hcl_testData")
hcl_itemMem = hcl.placeholder((itemMem.shape),"hcl_itemMem")
hcl_idMem = hcl.placeholder((idMem.shape),"hcl_idMem")
hcl_rdv1 = hcl.placeholder((trainData.shape[0],dim),"hcl_rdv1")
hcl_rdv2 = hcl.placeholder((testData.shape[0],dim),"hcl_rdv2")

s = hcl.create_schedule([hcl_trainData, hcl_testData, hcl_itemMem, hcl_idMem, hcl_rdv1, hcl_rdv2], kernel)

# print(hcl.lower(s))

f = hcl.build(s)

_trainData = hcl.asarray(trainData)
_testData = hcl.asarray(testData)
_itemMem = hcl.asarray(itemMem)
_idMem = hcl.asarray(idMem)
_rdv1 = hcl.asarray(np.random.choice([0,1], size=(trainData.shape[0], dim)))
_rdv2 = hcl.asarray(np.random.choice([0,1], size=(testData.shape[0], dim)))
_hdTrainData = hcl.asarray(np.zeros([trainData.shape[0], dim]))
_hdTestData = hcl.asarray(np.zeros([testData.shape[0], dim]))

start = time.time()
f(_trainData, _testData, _itemMem, _idMem, _rdv1, _rdv2, _hdTrainData, _hdTestData)
end = time.time()

time = end - start + end1 - start1
print("Encoding time in heterocl:",time)

np.save("hdTrainData", _hdTrainData.asnumpy())
np.save("hdTestData", _hdTestData.asnumpy())
