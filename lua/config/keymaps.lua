-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", "<leader>ls", function()
  require("live-server-nvim").toggle()
end)

local wk = require("which-key")

wk.add({
  { "<leader>a", group = "Artificial Intelligence", icon = "" },
  { "<leader>aq", "<cmd>CodeCompanion<cr>", desc = "Quick Prompt", icon = "⚡" },
  { "<leader>ac", "<cmd>CodeCompanionChat<cr>", desc = "Chat", icon = "💬" },
  { "<leader>aa", "<cmd>CodeCompanionActions<cr>", desc = "Actions", icon = "" },
})

wk.add({
  { "<leader>v", group = "Visual Studio", icon = "" },
  { "<leader>vr", "<cmd>Dotnet run<cr>", desc = "Run" },
  { "<leader>vb", "<cmd>Dotnet build<cr>", desc = "Build" },
  { "<leader>vd", "<cmd>Dotnet build<cr>", desc = "Debug" },
})

wk.add({
  {
    "<leader>d",
    group = "Debugger",
    nowait = true,
    remap = false,
  },
  {
    "<leader>dt",
    function()
      require("dap").toggle_breakpoint()
    end,
    desc = "Toggle Breakpoint",
    nowait = true,
    remap = false,
  },
  {
    "<leader>dc",
    function()
      require("dap").continue()
    end,
    desc = "Continue",
    nowait = true,
    remap = false,
  },
  {
    "<leader>di",
    function()
      require("dap").step_into()
    end,
    desc = "Step Into",
    nowait = true,
    remap = false,
  },
  {
    "<leader>do",
    function()
      require("dap").step_over()
    end,
    desc = "Step Over",
    nowait = true,
    remap = false,
  },
  {
    "<leader>du",
    function()
      require("dap").step_out()
    end,
    desc = "Step Out",
    nowait = true,
    remap = false,
  },
  {
    "<leader>dr",
    function()
      require("dap").repl.open()
    end,
    desc = "Open REPL",
    nowait = true,
    remap = false,
  },
  {
    "<leader>dl",
    function()
      require("dap").run_last()
    end,
    desc = "Run Last",
    nowait = true,
    remap = false,
  },
  {
    "<leader>dq",
    function()
      require("dap").terminate()
      require("dapui").close()
      require("nvim-dap-virtual-text").toggle()
    end,
    desc = "Terminate",
    nowait = true,
    remap = false,
  },
  {
    "<leader>db",
    function()
      require("dap").list_breakpoints()
    end,
    desc = "List Breakpoints",
    nowait = true,
    remap = false,
  },
  {
    "<leader>de",
    function()
      require("dap").set_exception_breakpoints({ "all" })
    end,
    desc = "Set Exception Breakpoints",
    nowait = true,
    remap = false,
  },
})
