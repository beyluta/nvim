-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
vim.api.nvim_set_hl(0, "LspInlayHint", { fg = "#b39ddb", bg = "NONE" })
vim.cmd.colorscheme("vscode") -- Default colorscheme
