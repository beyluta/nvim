return {
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    opts = {
      -- Fix for https://github.com/olimorris/codecompanion.nvim/discussions/2827 :
      -- Qwen3 (and similar) on a local OpenAI-compatible server requires the system
      -- message first, and tools break otherwise. This adapter merges all system
      -- messages into ONE leading message before sending.
      adapters = {
        http = {
          ["llama.cpp"] = function()
            return require("codecompanion.adapters").extend("openai_compatible", {
              env = {
                url = "http://localhost:11434", -- Ollama OpenAI-compatible base. Change for your llama.cpp server URL
                api_key = os.getenv("LLAMA_API_KEY") or "ollama",
                chat_url = "/v1/chat/completions",
              },
              handlers = {
                form_messages = function(self, messages)
                  local system_content = {}
                  local other_messages = {}
                  -- 1. Separate system messages from everything else
                  for _, msg in ipairs(messages) do
                    if msg.role == "system" then
                      table.insert(system_content, msg.content)
                    else
                      table.insert(other_messages, msg)
                    end
                  end

                  local final_messages = {}
                  -- 2. If there are system messages, merge them into ONE message at the top
                  if #system_content > 0 then
                    table.insert(final_messages, {
                      role = "system",
                      content = table.concat(system_content, "\n\n"),
                    })
                  end

                  -- 3. Append all the user/assistant messages
                  for _, msg in ipairs(other_messages) do
                    table.insert(final_messages, msg)
                  end

                  -- 4. Pass the cleaned messages to the stock OpenAI handler.
                  --    Version-aware lookup (fixes "attempt to call field 'form_messages'
                  --    (a nil value)" when codecompanion changes handler layouts):
                  --      v19.x: codecompanion.adapters.http.openai         -> handlers.form_messages
                  --      v20+:  codecompanion.adapters.http.openai_legacy -> handlers.form_messages
                  --              (plain "openai" became the Responses-API adapter, wrong body
                  --               format for local /v1/chat/completions servers)
                  local handler
                  for _, mod in ipairs {
                    "codecompanion.adapters.http.openai",
                    "codecompanion.adapters.http.openai_legacy",
                  } do
                    local ok, m = pcall(require, mod)
                    if ok and m.handlers and type(m.handlers.form_messages) == "function" then
                      handler = m.handlers.form_messages
                      break
                    end
                  end
                  if not handler then
                    -- Last resort: pass through as-is. Still satisfies the Qwen3 constraint
                    -- (exactly one system message, first). Loses image/document normalization.
                    return { messages = final_messages }
                  end
                  return handler(self, final_messages)
                end,
                parse_message_meta = function(self, data)
                  local extra = data.extra
                  if extra and extra.reasoning_content then
                    data.output.reasoning = { content = extra.reasoning_content }
                    if data.output.content == "" then
                      data.output.content = nil
                    end
                  end
                  return data
                end,
              },
            })
          end,
        },
      },
      interactions = {
        cmd = {
          adapter = "llama.cpp",
          model = "hf.co/unsloth/Qwen3.8-27B-GGUF:UD-IQ3_XXS",
          parameters = {
            top_k = 64,
            top_p = 0.95,
            temperature = 1.0,
            presence_penalty = 0.0,
          },
        },
        inline = {
          adapter = "llama.cpp",
          model = "hf.co/unsloth/Qwen3.8-27B-GGUF:UD-IQ3_XXS",
          parameters = {
            top_k = 64,
            top_p = 0.95,
            temperature = 1.0,
            presence_penalty = 0.0,
          },
        },
        chat = {
          adapter = "llama.cpp",
          model = "hf.co/unsloth/Qwen3.8-27B-GGUF:UD-IQ3_XXS",
          parameters = {
            top_k = 64,
            top_p = 0.95,
            temperature = 1.0,
            presence_penalty = 0.0,
          },
        },
      },
    },
  },
}
