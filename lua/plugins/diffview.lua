return {
  {
    "sindrets/diffview.nvim",
    config = function()
      require("diffview").setup({
        view = {
          default = {
            layout = "diff2_horizontal",
          },
        },
      })
      vim.api.nvim_set_keymap("n", "<leader>gD", ":DiffviewOpen<CR>", { noremap = true, silent = true })
    end,
  },
}
