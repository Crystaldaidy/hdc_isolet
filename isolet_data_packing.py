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

#data-packing bitwidth
bw = 100

def kernel(hdTrainData, trainLabels, hdTestData, testLabels, rdv3, epoch):
    def learn(k, hdTrainData, prototype, prototypeCounter):
        #Find samples that have the label k
        match = hcl.compute(hdTrainData.shape, 
                        lambda x,y: hcl.select(trainLabels[x] == k, hdTrainData[x][y], 0), "match")
        #Record the number of these samples
        with hcl.for_(0,hdTrainData.shape[0]) as a:
            with hcl.if_(trainLabels[a] == k):
                max[k] += 1
        #Do hdc sum on these samples' hdv
        r = hcl.reduce_axis(0, hdTrainData.shape[0], 'r')
        result = hcl.compute((hdTrainData.shape[1],), lambda y: hcl.sum(match[r][y], axis=r), "result")
        #Do the binary voting
        sum1 = hcl.compute((hdTrainData.shape[1],), lambda x: 0, "sum1", dtype=hcl.UInt(1))
        with hcl.if_(max[k] % 2 == 0):
            hcl.update(sum1, lambda x: hcl.select(result[x] + rdv3[k][x] - max[k]/2 > 0, 1, 0))
        with hcl.else_():
            hcl.update(sum1, lambda x: hcl.select(result[x] - max[k]/2 > 0, 1, 0))
        #Push the binary sum to prototype and the original sum to prototypeCounter
        with hcl.for_(0, dim) as t:
            prototype[k][t] = sum1[t]
            prototypeCounter[k][t] = result[t]

    def popcount(value):
        #Calculate the number of one in a binary number
        count = hcl.scalar(0, "count")
        numb = hcl.scalar(value,"numb", dtype=hcl.UInt(bw))
        with hcl.while_(numb.v > 0):
            count.v += 1
            numb.v &= numb.v - 1
        return count.v

    def test_hdc_accu(proto, hyper_dataset, labels, type):
        #pack the prototype
        pack_proto = hcl.pack(proto, axis=1, dtype=hcl.UInt(bw), name="pack_proto") 

        ###data preparation
        distance1 = hcl.compute((hyper_dataset.shape[1],), lambda x: 0, 'distance1', dtype=hcl.UInt(bw))
        pre_hamming = hcl.compute((hyper_dataset.shape[1],), lambda x: 0, "pre_hamming")
        hamming_dist1 = hcl.compute((numClasses,), lambda x: 0, "hamming_dist1")
        m1 = hcl.reduce_axis(0, hyper_dataset.shape[1], "m1")
        correct1 = hcl.scalar(0, 'correct1')
        ###

        with hcl.for_(0, hyper_dataset.shape[0]) as i:
            hcl.print((i),"%d suc\n")
            with hcl.for_(0, numClasses) as n:
                #Do hdc multiplication(XOR) on sample[i]'s hdv and prototype[n]'s hdv (elementwise on the high-bit data)
                hcl.update(distance1, lambda x: hyper_dataset[i][x] ^ pack_proto[n][x])
                #Calculate the hamming distance of the two vectors by adding 1s
                hcl.update(pre_hamming, lambda x: popcount(distance1[x]))
                hcl.print((),"sum of 1s suc")
                ###########################seg fault
                hamming_dist1[n] = hcl.sum(pre_hamming[m1], axis=m1)

            #Find the one having the least hamming distance and choose it's label as the predicted label
            pred1 = hcl.scalar(0, 'pred1')
            with hcl.for_(0, hamming_dist1.shape[0]) as j:
                with hcl.if_(hamming_dist1[j] < hamming_dist1[pred1]):
                    pred1.v = j

            with hcl.if_(pred1.v == labels[i]):
                correct1.v += 1

        #Print the accuracy
        all1 = hcl.scalar(hyper_dataset.shape[0], "all1", dtype=hcl.Float(32))
        accuracy1 = hcl.compute((1,), lambda x: correct1.v/all1.v*100, "accuracy1" , dtype=hcl.Float(32))
        with hcl.if_(type == 1):
            hcl.print((correct1, hyper_dataset.shape[0], accuracy1[0]), "Training accu: %d/%d (%.2f%%)\n")
        with hcl.else_():
            hcl.print((correct1, hyper_dataset.shape[0], accuracy1[0]), "Testing accu: %d/%d (%.2f%%)\n")

    def update(l, prototype, prototypeCounter, max):
        hcl.print((l+1),"%d:Use hard examples to update the prototype counters.\n")

        ###data preparation
        distance = hcl.compute((pack_traindata.shape[1],), lambda x: 0, 'distance', dtype=hcl.UInt(bw))
        pre_dist = hcl.compute((pack_traindata.shape[1],), lambda x: 0, "pre_dist")
        hamming_dist = hcl.compute((numClasses,), lambda x: 0, "hamming_dist")
        m = hcl.reduce_axis(0, pack_traindata.shape[1], "m")
        ###

        with hcl.for_(0, pack_traindata.shape[0]) as i:
            hcl.print((i),"%d suc\n")
            pack_proto = hcl.pack(prototype, axis=1, dtype=hcl.UInt(bw), name="pack_proto") 
            with hcl.for_(0, numClasses) as n:
                #Do hdc multiplication(XOR) on sample[i]'s hdv and prototype[n]'s hdv (elementwise on the high-bit data)
                hcl.update(distance, lambda x: pack_traindata[i][x] ^ pack_proto[n][x])
                #Calculate the hamming distance of the two vectors by adding 1s
                hcl.update(pre_dist, lambda x: popcount(distance[x]))
                hcl.print((),"sum of 1s suc")
                hamming_dist[n] = hcl.sum(pre_dist[m], axis=m)

            #Find the one having the least hamming distance and choose it's label as the predicted label
            pred = hcl.scalar(0, 'pred')
            with hcl.for_(0, hamming_dist.shape[0]) as j:
                with hcl.if_(hamming_dist[j] < hamming_dist[pred]):
                    pred.v = j

            #Adjust the proto vectors by adding the sample vector on its label proto hdv and substrct it on its predicted proto hdv
            with hcl.if_(pred.v != trainLabels[i]):
                max[trainLabels[i]] += 1
                max[pred] -= 1
                with hcl.for_(0, dim) as m:
                    with hcl.if_(hdTrainData[i][m] == 1):
                        ###########
                        prototypeCounter[trainLabels[i]][m] += 1
                        prototypeCounter[pred][m] -= 1
                    # prototypeCounter[trainLabels[i]][m] += hdTrainData[i][m]
                    # prototypeCounter[pred][m] -= hdTrainData[i][m]
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
        hcl.mutate((1,), lambda x: test_hdc_accu(prototype, pack_traindata, trainLabels, 1), 'training_update')
        hcl.mutate((1,), lambda x: test_hdc_accu(prototype, pack_testdata, testLabels, 2), 'testing_update')

    #Packing the encoded training data and testing data
    pack_traindata = hcl.pack(hdTrainData, axis=1, dtype=hcl.UInt(bw), name="pack_traindata")
    pack_testdata = hcl.pack(hdTestData, axis=1, dtype=hcl.UInt(bw), name="pack_testdata")

    ###learn
    hcl.print((),"Learning the prototype HDVs.\n")
    #prototype is the vector used to represent a label
    prototype = hcl.compute((numClasses, dim), lambda x, y: 0, "prototype", dtype=hcl.UInt(1))
    prototypeCounter = hcl.compute((numClasses, dim), lambda x, y: 0, "prototypeCounter") #Every dimension is the sum of the targeted data

    #max is the number records the added vectors, later for binary voting
    max = hcl.compute((numClasses, ), lambda x: 0) 
    hcl.mutate((numClasses,), lambda k: learn(k, hdTrainData, prototype, prototypeCounter),"learn")
    
    #Test the accuracy after learning
    hcl.mutate((1,), lambda x: test_hdc_accu(prototype, pack_traindata, trainLabels, 1), "test_train_accu")
    hcl.mutate((1,), lambda x: test_hdc_accu(prototype, pack_testdata, testLabels, 2), "test_test_accu")

    ###update
    hcl.mutate((2,), lambda x: update(x, prototype, prototypeCounter, max),"update")

hcl.init(hcl.Int())

hcl_hdTrainData = hcl.placeholder((hdTrainData.shape),"hcl_trainData", dtype=hcl.UInt(1))
hcl_trainLabels = hcl.placeholder((trainLabels.shape),"hcl_trainLabels")
hcl_hdTestData = hcl.placeholder((hdTestData.shape),"hcl_testData", dtype=hcl.UInt(1))
hcl_testLabels = hcl.placeholder((testLabels.shape),"hcl_testLabels")
hcl_rdv3 = hcl.placeholder((numClasses,dim),"hcl_rdv3")
hcl_epoch = hcl.placeholder((1,),"hcl_epoch")

s = hcl.create_schedule([hcl_hdTrainData, hcl_trainLabels, hcl_hdTestData, hcl_testLabels, hcl_rdv3, hcl_epoch], kernel)

# print(hcl.lower(s))
f = hcl.build(s)



_hdTrainData = hcl.asarray(hdTrainData, dtype=hcl.UInt(1))
_trainLabels = hcl.asarray(trainLabels)
_hdTestData = hcl.asarray(hdTestData, dtype=hcl.UInt(1))
_testLabels = hcl.asarray(testLabels)
_rdv3 = hcl.asarray(np.random.choice([0,1], size=(numClasses, dim)))
_epoch = hcl.asarray([30])

f(_hdTrainData, _trainLabels, _hdTestData, _testLabels, _rdv3, _epoch)
