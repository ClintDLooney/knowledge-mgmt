Chain-of-thought (CoT) prompting is a technique that divides intricate reasoning tasks into smaller, intermediary steps. This approach can be employed using either zero-shot or few-shot prompting techniques.  CoT prompts are tailored to specific problem types. To initiate the chain-of-thought reasoning process in a machine learning model, you can use the phrase "Think step by step." It is recommended to use CoT prompting when the task requires multiple steps or a series of logical reasoning.

## Examples
## CoT using zero-shot
Prompt	Output
Which service requires a larger deposit based on the following information?

The total cost of service A is $50,000, and it requires a 30 percent deposit.

The total cost of service B is $40,000, and it requires a 40 percent deposit.

Think step by step.
The deposit for service A is 30 percent of $50,000, which is
0.3 * 50,000 = $15,000



The deposit for service B is 40 percent of $40,000, which is
0.4 * 40,000 = $16,000



Therefore, based on the given information, service B requires a larger deposit.



## CoT using few-shot
Prompt	Output
Question: If there are 2 bags with 3 oranges each, how many oranges are there in total?
Answer: 2 bags, 3 oranges each. 2 * 3 = 6 oranges.

Question: If there are 4 cars with 2 passengers each, how many passengers are there in total?
Answer: 4 cars, 2 passengers each. 4 * 2 = 8 passengers.

Question: If there are 3 baskets, and each basket has 5 apples, how many apples are there in total?
Answer: (Think step by step.)	Answer: 3 baskets, 5 apples each. 3 * 5 = 15 apples.

## Other
## Updated scenario prompt using few-shot prompting

|   |
|---|
|**Prompt**|
|Generate a comprehensive market analysis report for a new product category in the finance industry. The target audience is small and medium-sized businesses (SMBs). Use the attached template to structure the report into categories. _[attach report template]_  <br>  <br>The following examples are market analysis reports for previously released products.  <br>  <br>Example 1: _[insert example market analysis report]_  <br>  <br>Example 2: _[insert example market analysis report]_|

