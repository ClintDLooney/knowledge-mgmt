The underlying LLM of a chatbot is stateless. 
When you send the second request of a thread to a chatbot, the model isn't reacting to your second message. It's re-sending all the previous prompts and responses in the entire thread to fill in the blanks of what it's newe3st response should be. \
[[Context Window]]