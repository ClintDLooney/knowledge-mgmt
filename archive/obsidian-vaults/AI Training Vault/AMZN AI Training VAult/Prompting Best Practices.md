//TODO Streamline & Subdivide

1. ## 

Be clear and concise.

Prompts should be straightforward and avoid ambiguity. Clear prompts lead to more coherent responses. Craft prompts with natural, flowing language and coherent sentence structure. Avoid isolated keywords and phrases.

  

Bad prompt

|   |
|---|
|Compute the sum total of the subsequent sequence of numerals: 4, 8, 12, 16.|

  

Good prompt

|                                                 |
| ----------------------------------------------- |
| What is the sum of these numbers: 4, 8, 12, 16? |

## 

2. Include context if needed.

Provide any additional context that would help the model respond accurately. For example, if you ask a model to analyze a business, include information about the type of business. What does the company do? This type of detail in the input provides more relevant output. The context that you provide can be common across multiple inputs or specific to each input.

  

Bad prompt

|   |
|---|
|Summarize this article: [insert article text]|

  

Good prompt

|   |
|---|
|Provide a summary of this article to be used in a blog post: [insert article text]|

## 

3. Use directives for the appropriate response type.

If you want a particular output form, such as a summary, question, or poem, specify the response type directly. You can also limit responses by length, format, included information, excluded information, and more.

  

Bad prompt

|   |
|---|
|What is the capital?|

  

Good prompt

|                                                                         |
| ----------------------------------------------------------------------- |
| What is the capital of New York? Provide the answer in a full sentence. |

## 

4. Consider the output in the prompt.

Mention the requested output at the end of the prompt to keep the model focused on appropriate content.

  

Bad prompt

|   |
|---|
|Calculate the area of a circle.|

  

Good prompt

|                                                                                                              |
| ------------------------------------------------------------------------------------------------------------ |
| Calculate the area of a circle with a radius of 3 inches (7.5 cm). Round your answer to the nearest integer. |

5. Start prompts with an interrogation.

Phrase your input as a question, beginning with words, such as who, what, where, when, why, and how.

  

Bad prompt

|   |
|---|
|Summarize this event.|

  

Good prompt

|                                                        |
| ------------------------------------------------------ |
| Why did this event happen? Explain in three sentences. |
 6. ## 

Provide an example response.

Use the expected output format as an example response in the prompt. Surround it in brackets to make it clear that it is an example.

  

Bad prompt

|   |
|---|
|Determine the sentiment of this social media post: [insert post]|

  

Good prompt

|                                                                                                                                                                                                                   |
| ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Determine the sentiment of the following social media post using these examples:  <br>post: "great pen" => Positive  <br>post: "I hate when my phone battery dies" => Negative  <br>[insert social media post] => |
7. ## 

Break up complex tasks.

Foundation models can get confused when asked to perform complex tasks. Break up complex tasks by using the following techniques:

- Divide the task into several subtasks. If you cannot get reliable results, try splitting the task into multiple prompts.
- Ask the model if it understood your instruction. Provide clarification based on the model's response.
- If you don’t know how to break the task into subtasks, ask the model to think step by step. You will learn more about this type of prompt technique later on in this course. This method might not work for all models, but you can try to rephrase the instructions in a way that makes sense for the task. For example, you might request that the model divides the task into subtasks, approaches the problem systematically, or reasons through the problem one step at a time.

8. ## 

Experiment and be creative.

Try different prompts to optimize the model's responses. Determine which prompts achieve effective results and which prompts achieve inaccurate results. Adjust your prompts accordingly. Novel and thought-provoking prompts can lead to innovative outcomes.

9. ## 

Use [[Prompt Template]]s.

Prompt templates are predefined structures or formats that can be used to provide consistent inputs to FMs. They help ensure that the prompts are phrased in a way that is easily understood by the model and can lead to more reliable and higher-quality outputs. Prompt templates often include instructions, context, examples, and placeholders for information relevant to the task at hand.

  Prompt templates can help streamline the process of interacting with models, making it easier to integrate them into various applications and workflows.


## Examples
Original prompt
Prompt
Generate a market analysis report for a new product category.
Updated prompt
Parameters
Temperature: 0.9
Top p: 0.999
Maximum length: 5,000
Prompt
Generate a comprehensive market analysis report for a new product category in the finance industry for an audience of small and medium-sized businesses (SMBs). Structure the report with the following sections:

1. Executive Summary
2. Industry Overview
3. Target Audience Analysis
4. Competitive Landscape
5. Product Opportunity and Recommendations
6. Financial Projections

The tone should be professional and tailored to the target audience of SMBs.

This updated prompt incorporates the following parameter settings and best practices:

1
Parameters – The updated prompt has the parameters for temperature and top p set high. This will encourage the model to produce a more creative output that might include some points that you wouldn't necessarily think of. The maximum length parameter is also set at 5,000.

2
Include context – The updated prompt clarifies that the company is in the finance industry, which helps the model tailor the analysis accordingly.

3
Use directives for the appropriate response type – The prompt breaks down the market analysis report into specific sections, making it easier for the model to structure the output.

