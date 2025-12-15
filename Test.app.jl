using LlamaCpp

# const model = "/mnt/c/src/models/Llama-3.2-3B-Instruct-Q4_K_M.gguf"
const model = "/mnt/c/src/models/Llama-3.2-1B-Instruct-Q4_K_M.gguf"
text = read("edge_uiatest_output.txt", String)
# text = "The square of the hypotenuse is equal to the sum of the squares of the other two sides."

prompt = 
"""
Read the following text extracted from a Twitter page and extract exactly three (3) main points into a bulleted list.

--- ARTICLE ---
$(text)
--- END ARTICLE ---

Key Takeaways:
"""

run_chat(; model, prompt, ctx_size=4096)
