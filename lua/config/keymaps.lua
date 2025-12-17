-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", "<leader>ls", function()
  require("live-server-nvim").toggle()
end)

local wk = require("which-key")
wk.add({
  { "<leader>v", group = "Visual Studio", icon = "" },
  { "<leader>vr", "<cmd>Dotnet run<cr>", desc = "Run" },
  { "<leader>vb", "<cmd>Dotnet build<cr>", desc = "Build" },
  { "<leader>vd", "<cmd>Dotnet build<cr>", desc = "Debug" },
})
