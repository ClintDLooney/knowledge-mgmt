Top p is a setting that controls the diversity of the text by limiting the number of words that the model can choose from based on their probabilities. Top p is also set on a scale from 0 to 1. The following are examples of different top p settings.  
  

|   |   |
|---|---|
|Low top p (for example, 0.250)|High top p (for example, 0.990)|
|With a low top p setting, like 0.250, the model will only consider words that make up the top 25 percent of the total probability distribution. This can help the output be more focused and coherent, because the model is limited to choosing from the most probable words given the context.|With a high top p setting, like 0.990, the model will consider a broad range of possible words for the next word in the sequence, because it will include words that make up the top 99 percent of the total probability distribution. This can lead to more diverse and creative output, because the model has a wider pool of words to choose from.|