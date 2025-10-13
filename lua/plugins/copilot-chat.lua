return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "zbirenbaum/copilot.lua" },
      { "nvim-lua/plenary.nvim", branch = "master" },
    },
    build = "make tiktoken",
    opts = {
      model = "claude-sonnet-4.5", -- Model to use
      auto_insert_mode = false, -- Stays in normal mode when opening chat
      insert_at_end = true, -- Move to end of buffer on insert mode
      tools = "copilot", -- Tools to use
      resources = "buffer:listed", -- Resources to use
      diff = "unified", -- Diff to use
      window = {
        layout = "float", -- Floating window
        width = 0.8, -- Width of the window
        height = 0.8, -- Height of the window
        border = "rounded", -- Box shadow
      },
      prompts = {
        Tailwind = {
          prompt = [[
              Using HTML, Tailwind CSS, and JavaScript follow these instructions:

              - Always separate CSS from HTML if Tailwind CSS is not possible 
              - Always use the code provided as a base for your changes
              - Always write the code before anything else
              - Always make a bullet point changelog at the end of the message
          ]],
        },
        Ionic = {
          prompt = [[
              Using Ionic Angular follow these instructions:

              - Always separate SCSS from HTML
              - Always write the TypeScript if HTML has bindings to variables
              - Always use the code provided as a base for your changes
              - Always prefer using native Ionic class names for styling than SCSS
              - Always write the code before anything else
              - Always make a bullet point changelog at the end of the message
          ]],
        },
      },
    },
  },
}
