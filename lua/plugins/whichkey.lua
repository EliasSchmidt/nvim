return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    plugins = {
      spelling = { enabled = false },
    },
    preset = "helix",
    win = {
      border = "rounded",
      -- position = "right",
      -- margin = { 0, 1, 0, 1 },
      padding = { 1, 2, 1, 2 },
    },
    layout = {
      height = { min = 1, max = 25 },
      width = { min = 20, max = 40 },
      spacing = 3,
      align = "left",
    },
    disable = {
      insert = true,
    }
  }
}
