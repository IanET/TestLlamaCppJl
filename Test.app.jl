using LlamaCpp

const model = "/mnt/c/src/models/Llama-3.2-3B-Instruct-Q4_K_M.gguf"
# const model = "/mnt/c/src/models/Llama-3.2-1B-Instruct-Q4_K_M.gguf"

# text = "The square of the hypotenuse is equal to the sum of the squares of the other two sides."
text = read("edge_uiatest_output.txt", String) |> t -> replace(t, "\n" => " ")

# prompt = 
# """
# Read the following text extracted from a Twitter page and extract the posts. List those posts including the author, the time and the tweet text in the form of a bulleted list. Do not include extranious information on the page like "Terms o Service". Do not include duplicate posts.

# --- TWITTER PAGE ---
# $(text)
# --- END TWITTER PAGE ---

# Key Takeaways:
# """

prompt = 
"""
Read the following article text extracted from a Twitter page and extract at most five (5) posts or reposts into a bulleted list. Include the author, the time and the tweet text only. 

--- ARTICLE ---
$(text)
--- END ARTICLE ---

Key Takeaways:
"""

run_chat(; model, prompt, ctx_size=4096)
