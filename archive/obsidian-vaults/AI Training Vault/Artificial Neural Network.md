Most often used for supervised learning. You train the network, then it tunes itself based on whether it correctly identifies the labeled data. 
In an ANN, adds weights to the connections between the neurons in each layer. 
ANNs self-tune by changing the [[Data Weights]] of connections between  neurons. 
When you first initialize an ANN, the system assigns a random weight to each neural connection. Then you feed in your training data and the ANN tunes itself for correct output. Rinse and repeat until high accuracy. 
But adding weights to connections only corrects [[Variance]], not [[Bias]]. 
In an [[Artificial Neural Network]], the Bias is the number that the system assigns to each neuron. This number will shift the data in a given direction to make it more accurate. The system must tune itself to balance between Bias and Variance.  [[Bias Variance Tradeoff]]. The main tuning mechanisms to achieve this balance are A) adding weights to the connections and B) adding bias to the neurons. Note the bias is only on the neurons, not on the connections. The ANN can only add bias after it sees what the variance results in. (It can only reposition the  dartboard after seeing where a few darts land.) Otherwise, the machine wouldn't know which way to shift the board. 


* ANNs tend to overfit the data. [[Overfitting]] is when a system adds a lot of complexity when it's training, overlearning lessons based on the training data that don't translate to the larger test data. Since an ANN overfits its training dataset, adjusting its variance might result in BIG shifts. This makes balancing bias and variance more difficult. 
* 

ML model use can be problematic to use when you have too much data, or that's what he says here. https://www.linkedin.com/learning/introduction-to-artificial-intelligence-24947908/build-a-neural-network?contextUrn=urn%3Ali%3AlyndaLearningPath%3A6477ad5c498e72fec31ca876
//TODO Why? Seek more information. 

Used to handle large datasets by breaking them down into smaller pieces, mimicking the structure of the human brain. 
A neural network is organized  into 3 layers of "neurons,"  left to right. 
* [[Input Layer]]
* [[Hidden Layers]]
* [[Output Layer]]
If a neural network has a lot of hidden layers, it's considered a [[Deep Learning Artificial Neural Network]].
To classify an image as a dog or not a dog: 
* Input = the image
* Output = dog/not dog designation. 

Neural networks are used for [[Supervised Machine Learning]] and can self-tune to improve accuracy.
Input data is sent to the hidden layer, each hidden layer neuron uses activation functions to decide whether to feed its data forward to the next hidden layer. The process ends with nodes in the output challebnge. In a binary classification task for instance, the output layer has 2 nodes. Each of these 2 nodes will have a probability score. 

[[Feed Forward Neural Network]]

Note that you don't have to figure out what the nuerons of the hidden layers are according to https://www.coursera.org/learn/ai-for-everyone/lecture/p457x/non-technical-explanation-of-deep-learning-part-1-optional
You provide input A and output B, and it figures out for itself what the hidden layer neurons should be computing. 
