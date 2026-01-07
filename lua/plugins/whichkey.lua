return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  config = function()
    require("which-key").setup({
      plugins = {
        spelling = { enabled = false },
      },
      win = {
        border = "rounded",
      },
      disable = {
        insert = true,
      }
    })
  end,
}
