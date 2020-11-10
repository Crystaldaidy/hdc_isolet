import numpy as np
import heterocl as hcl
import pickle


with open('isolet.pkl', 'rb') as f:
    isolet = pickle.load(f)

trainData, trainLabels, testData, testLabels = isolet
trainLabels = np.array(trainLabels)
testLabels = np.array(testLabels)

numClasses = 26
quantLevels = 100
bw = 64

# hdTrainData = np.load("hdTrainData.npy")
# hdTestData = np.load("hdTestData.npy")
pack_train = np.load("pack_train.npy")
pack_test = np.load("pack_test.npy")

def kernel(pack_train, trainLabels, pack_test, testLabels, rdv3, epoch):
    def learn(k, hdTrainData, prototype, prototypeCounter):
        #Find samples that have the label k
        match = hcl.compute(hdTrainData.shape, 
                        lambda x,y: hcl.select(trainLabels[x] == k, hdTrainData[x][y], 0), "match")
        #Record the number of these samples
        with hcl.for_(0, hdTrainData.shape[0]) as a:
            with hcl.if_(trainLabels[a] == k):
                max[k] += 1
        #Do hdc sum on these samples' hdv
        r = hcl.reduce_axis(0, hdTrainData.shape[0], 'r')
        result = hcl.compute((hdTrainData.shape[1],), lambda y: hcl.sum(match[r][y], axis=r), "result")
        #Do the binary voting
        sum1 = hcl.compute((hdTrainData.shape[1],), lambda x: 0, "sum1")
        with hcl.if_(max[k] % 2 == 0):
            hcl.update(sum1, lambda x: hcl.select(result[x] + rdv3[k][x] - max[k]/2 > 0, 1, 0))
        with hcl.else_():
            hcl.update(sum1, lambda x: hcl.select(result[x] - max[k]/2 > 0, 1, 0))
        #Push the binary sum to prototype and the original sum to prototypeCounter
        with hcl.for_(0, hdTrainData.shape[1]) as t:
            prototype[k][t] = sum1[t]
            prototypeCounter[k][t] = result[t]

    def test_hdc_accu(proto, hyper_dataset, labels, type):
        ###data preparation
        distance1 = hcl.compute((hyper_dataset.shape[1],), lambda x: 0, 'distance1')
        hamming_dist1 = hcl.compute((numClasses,), lambda x: 0, "hamming_dist1")
        m1 = hcl.reduce_axis(0, hyper_dataset.shape[1], "m1")
        correct1 = hcl.scalar(0, 'correct1')
        ###

        with hcl.for_(0, hyper_dataset.shape[0]) as i:
            with hcl.for_(0, numClasses) as n:
                #Do hdc multiplication(XOR) on sample[i]'s hdv and prototype[n]'s hdv (elementwise on the high-bit data)
                hcl.update(distance1, lambda x: hyper_dataset[i][x] ^ proto[n][x])
                #Calculate the hamming distance of the two vectors by adding 1s
                hamming_dist1[n] = hcl.sum(distance1[m1], axis=m1)

            #Find the one having the least hamming distance and choose it's label as the predicted label
            pred1 = hcl.scalar(0, 'pred1')
            with hcl.for_(0, hamming_dist1.shape[0]) as j:
                with hcl.if_(hamming_dist1[j] < hamming_dist1[pred1]):
                    pred1.v = j

            with hcl.if_(pred1.v == labels[i]):
                correct1.v += 1

        #Print the accuracy
        all1 = hcl.scalar(hyper_dataset.shape[0], "all1", dtype = hcl.Float(32))
        accuracy1 = hcl.compute((1,), lambda x: correct1.v/all1.v*100, "accuracy1" , dtype = hcl.Float(32))
        with hcl.if_(type == 1):
            hcl.print((correct1, hyper_dataset.shape[0], accuracy1[0]), "Training accu: %d/%d (%.2f%%)\n")
        with hcl.else_():
            hcl.print((correct1, hyper_dataset.shape[0], accuracy1[0]), "Testing accu: %d/%d (%.2f%%)\n")

    def update(l, prototype, prototypeCounter, max):
        hcl.print((l+1),"%d:Use hard examples to update the prototype counters.\n")

        ###data preparation
        distance = hcl.compute((hdTrainData.shape[1],), lambda x: 0, 'distance')
        hamming_dist = hcl.compute((numClasses,), lambda x: 0, "hamming_dist")
        m = hcl.reduce_axis(0, hdTrainData.shape[1], "m")
        ###

        with hcl.for_(0, hdTrainData.shape[0]) as i:
            with hcl.for_(0, numClasses) as n:
                #Do hdc multiplication(XOR) on sample[i]'s hdv and prototype[n]'s hdv (elementwise on the high-bit data)
                hcl.update(distance, lambda x: hdTrainData[i][x] ^ prototype[n][x])
                #Calculate the hamming distance of the two vectors by adding 1s
                hamming_dist[n] = hcl.sum(distance[m], axis=m)

            #Find the one having the least hamming distance and choose it's label as the predicted label
            pred = hcl.scalar(0, 'pred')
            with hcl.for_(0, hamming_dist.shape[0]) as j:
                with hcl.if_(hamming_dist[j] < hamming_dist[pred]):
                    pred.v = j

            #Adjust the proto vectors by adding the sample vector on its label proto hdv and substrct it on its predicted proto hdv
            with hcl.if_(pred.v != trainLabels[i]):
                max[trainLabels[i]] += 1
                max[pred] -= 1
                with hcl.for_(0, hdTrainData.shape[1]) as m:
                    prototypeCounter[trainLabels[i]][m] += hdTrainData[i][m]
                    prototypeCounter[pred][m] -= hdTrainData[i][m]
                    with hcl.if_(max[trainLabels[i]] % 2 == 0):
                        with hcl.if_(prototypeCounter[trainLabels[i]][m] - max[trainLabels[i]]/2 == 0):
                            prototype[trainLabels[i]][m] &= 1
                    with hcl.else_():
                        prototype[trainLabels[i]][m] = hcl.select(prototypeCounter[trainLabels[i]][m] - max[trainLabels[i]]/2 > 0, 1, 0)

                    with hcl.if_(max[pred] % 2 == 0):
                        with hcl.if_(prototypeCounter[pred][m] - max[pred]/2 == 0):
                            prototype[pred][m] &= 1
                    with hcl.else_():
                        prototype[pred][m] = hcl.select(prototypeCounter[pred][m] - max[pred]/2 > 0, 1, 0)

        #print the accuracy
        hcl.mutate((1,), lambda x: test_hdc_accu(prototype, hdTrainData, trainLabels, 1), 'training_update')
        hcl.mutate((1,), lambda x: test_hdc_accu(prototype, hdTestData, testLabels, 2), 'testing_update')

    ###unpack
    hdTrainData = hcl.unpack(pack_train, axis=1, dtype=hcl.UInt(1), name="hdTrainData")
    hdTestData = hcl.unpack(pack_test, axis=1, dtype=hcl.UInt(1), name="hdTestData")

    ###learn
    hcl.print((),"Learning the prototype HDVs.\n")
    prototype = hcl.compute((numClasses, hdTrainData.shape[1]), lambda x, y: 0, "prototype",)
    prototypeCounter = hcl.compute((numClasses, hdTrainData.shape[1]), lambda x, y: 0, "prototypeCounter") #Every dimension is the sum of the targeted data

    #max is the number records the added vectors, later for binary voting
    max = hcl.compute((numClasses, ), lambda x: 0)
    hcl.mutate((numClasses,), lambda k: learn(k, hdTrainData, prototype, prototypeCounter),"learn")
    
    #Test the accuracy after learning
    hcl.mutate((1,), lambda x: test_hdc_accu(prototype, hdTrainData, trainLabels, 1), "test_train_accu")
    hcl.mutate((1,), lambda x: test_hdc_accu(prototype, hdTestData, testLabels, 2), "test_test_accu")

    ###update
    hcl.mutate((epoch[0],), lambda x: update(x, prototype, prototypeCounter, max),"update")

hcl.init()

hcl_hdTrainData = hcl.placeholder((pack_train.shape),"hcl_trainData", dtype=hcl.UInt(bw))
hcl_trainLabels = hcl.placeholder((trainLabels.shape),"hcl_trainLabels")
hcl_hdTestData = hcl.placeholder((pack_test.shape),"hcl_testData", dtype=hcl.UInt(bw))
hcl_testLabels = hcl.placeholder((testLabels.shape),"hcl_testLabels")
hcl_rdv3 = hcl.placeholder((numClasses,pack_train.shape[1]*bw),"hcl_rdv3")
hcl_epoch = hcl.placeholder((1,),"hcl_epoch")

s = hcl.create_schedule([hcl_hdTrainData, hcl_trainLabels, hcl_hdTestData, hcl_testLabels, hcl_rdv3, hcl_epoch], kernel)

target = hcl.platform.zc706
# target.config(compile="vitis", mode="hw_exe")
# target.config(compile="vivado_hls", mode="csim|csyn")
target.config(compile="vivado_hls", mode="csim")

# print(hcl.lower(s))
f = hcl.build(s)



_pack_train = hcl.asarray(pack_train, dtype=hcl.UInt(bw))
_trainLabels = hcl.asarray(trainLabels)
_pack_test = hcl.asarray(pack_test, dtype=hcl.UInt(bw))
_testLabels = hcl.asarray(testLabels)
_rdv3 = hcl.asarray(np.random.choice([0,1], size=(numClasses, pack_train.shape[1]*bw)))
_epoch = hcl.asarray([30])

f(_pack_train, _trainLabels, _pack_test, _testLabels, _rdv3, _epoch)
