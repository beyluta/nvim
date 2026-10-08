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
          model = "gemma4:12b",
          parameters = {
            top_k = 64,
            top_p = 0.95,
            temperature = 1.0,
            presence_penalty = 0.0,
          },
        },
        chat = {
          adapter = "ollama",
          model = "gemma4:12b",
          parameters = {
            top_k = 64,
            top_p = 0.95,
            temperature = 1.0,
            presence_penalty = 0.0,
          },
        },
        inline = {
          adapter = "ollama",
          model = "gemma4:12b",
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
