Few-shot prompting is a technique that involves providing a language model with contextual examples to guide its understanding and expected output for a specific task. In this approach, you supplement the prompt with sample inputs and their corresponding desired outputs, effectively giving the model a _few shots_ or demonstrations to condition it for the requested task. Although few-shot prompting provides a model with multiple examples, you can also use single-shot or one-shot prompting by providing just one example. [[One Shot Prompting]]


When employing a few-shot prompting technique, consider the following tips:

- •
    
    Make sure to select examples that are representative of the task that you want the model to perform and cover a diverse range of inputs and outputs. Additionally, aim to use clear and concise examples that accurately demonstrate the desired behavior.
    
- •
    
    Experiment with the number of examples. The optimal number of examples to include in a few-shot prompt can vary depending on the task, the model, and the complexity of the examples themselves. Generally, providing more examples can help the model better understand the task. But too many examples might introduce noise or confusion.

## Example
## Few-shot prompt

|   |   |
|---|---|
|**Prompt**|**Output**|
|Tell me the sentiment of the following news headline and categorize it as positive, negative, or neutral. Here are some examples:  <br>  <br>Investment firm fends off allegations of corruption  <br>Answer: Negative  <br>  <br>Local teacher awarded with national prize  <br>Answer: Positive<br><br>  <br><br>Community organization exceeds fundraising goal, to provide meals for thousands in need<br><br>Answer:|

