return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "zbirenbaum/copilot.lua" },
      { "nvim-lua/plenary.nvim", branch = "master" },
    },
    build = "make tiktoken",
    opts = {
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
