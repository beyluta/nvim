return {
  {
    "petertriho/nvim-scrollbar",
    config = function()
      require("scrollbar").setup({
        handle = {
          color = "#264f78",
        },
        marks = {
          Search = { color = "#d7ba7d" },
          Error = { color = "#f48771" },
          Warn = { color = "#cca700" },
          Info = { color = "#4fc1ff" },
          Hint = { color = "#4fc1ff" },
          Misc = { color = "#c586c0" },
        },
      })
    end,
  },
}
