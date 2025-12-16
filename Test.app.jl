using LlamaCpp


if Sys.islinux()
    const model = "/mnt/c/src/models/Phi-3.5-mini-instruct.Q5_K_M.gguf"
else
    const model = "C:\\src\\models\\Phi-3.5-mini-instruct.Q5_K_M.gguf"
end
# const model = "/mnt/c/src/models/Llama-3.2-1B-Instruct-Q4_K_M.gguf"

# text = "The square of the hypotenuse is equal to the sum of the squares of the other two sides."
text = read("edge_uiatest_output.txt", String) |> t -> replace(t, "\n" => " ")

prompt = 
"""
Read the following article text extracted from a Twitter page and extract at most five (5) posts or reposts into a bulleted list. Include the author, the time and the tweet text only. 

--- ARTICLE ---
$(text)
--- END ARTICLE ---

Key Takeaways:
"""

run_chat(; model, prompt, ctx_size=4096)
