return {
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    opts = {
      interactions = {
        chat = {
          tools = {
            ["web_search"] = {
              opts = {
                adapter = "duckduckgo",
              },
            },
          },
        },
      },
      strategies = {
        cmd = {
          adapter = "ollama",
          model = "qwen3.5:latest",
          parameters = {
            top_k = 20,
            top_p = 0.95,
            temperature = 0.6,
            presence_penalty = 0.0,
          },
        },
        chat = {
          adapter = "ollama",
          model = "qwen3.5:latest",
          parameters = {
            top_k = 20,
            top_p = 0.95,
            temperature = 0.6,
            presence_penalty = 0.0,
          },
        },
        inline = {
          adapter = "ollama",
          model = "qwen3.5:latest",
          parameters = {
            top_k = 20,
            top_p = 0.95,
            temperature = 0.6,
            presence_penalty = 0.0,
          },
        },
      },
    },
  },
}
