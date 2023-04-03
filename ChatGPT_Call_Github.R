# How to call the new (as of 2023-04-03) ChatGPT API from R
# Get your API key over here: https://platform.openai.com/account/api-keys
api_key <- "your_API_key"
library(httr)
library(stringr)
# Calls the ChatGPT API with the given prompt and returns the answer
ask_chatgpt <- function(prompt) {
  response <- POST(
    url = "https://api.openai.com/v1/chat/completions", 
    add_headers(Authorization = paste("Bearer", api_key)),
    content_type_json(),
    encode = "json",
    body = list(
      model = "gpt-3.5-turbo", # May be subject to change
      messages = list(list(
        role = "user", 
        content = prompt
      ))
    )
  )
  str_trim(content(response)$choices[[1]]$message$content)
}

# Example Question 1:
answer <- ask_chatgpt("Can you interact directly with excel?")
cat(answer)