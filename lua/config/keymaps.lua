-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

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
  { "<leader>l", group = "Live Server", icon = "📹" },
  { "<leader>ls", "<cmd>LiveServerStart<cr>", desc = "Start Live Server", icon = "▶" },
  { "<leader>lp", "<cmd>LiveServerStop<cr>", desc = "Stop Live Server", icon = "⏯" },
  { "<leader>lt", "<cmd>LiveServerToggle<cr>", desc = "Toggle Live Server", icon = "⏹" },
})
