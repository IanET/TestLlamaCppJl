using LlamaCpp


if Sys.islinux()
    const model_dir = "/mnt/c/src/models/"
else
    const model_dir = "C:\\src\\models\\"
end

const model_name = "google_gemma-3-4b-it-Q4_K_M.gguf"
const model = joinpath(model_dir, model_name)

text = read("edge_uiatest_output.txt", String) |> t -> replace(t, "\n" => " ")

prompt = 
"""
The following article is a page from Twitter, summarize the recent posts as bullet points:

--- ARTICLE ---
$(text)
--- END ARTICLE ---

"""

run_chat(; model, prompt, ctx_size=4096)
