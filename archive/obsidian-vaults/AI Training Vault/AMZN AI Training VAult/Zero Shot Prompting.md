//TODO S&S

Zero-shot prompting is a technique where a user presents a task to a generative model without providing any examples or explicit training for that specific task. In this approach, the user relies on the model's general knowledge and capabilities to understand and carry out the task without any prior exposure, or _shots_, of similar tasks. Remarkably, modern FMs have demonstrated impressive zero-shot performance, effectively tackling tasks thatthey were not explicitly trained for.

To optimize zero-shot prompting, consider the following tips:

- •
    
    The larger and more capable the FM, the higher the likelihood of obtaining effective results from zero-shot prompts.
    
- •
    
    [[Instruction Tuning]], a process of fine-tuning models to better align with human preferences, can enhance zero-shot learning capabilities. One approach to scale instruction tuning is through reinforcement learning from human feedback ([[RLHF]]), where the model is iteratively trained based on human evaluations of its outputs.