return {
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    opts = {
      strategies = {
        cmd = {
          adapter = "ollama",
          model = "qwen3.5:latest",
        },
        chat = {
          adapter = "ollama",
          model = "qwen3.5:latest",
        },
        inline = {
          adapter = "ollama",
          model = "qwen3.5:latest",
        },
      },
    },
  },
}
