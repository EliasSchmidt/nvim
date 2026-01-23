return {
  "catppuccin/nvim",
  config = function()
    require("catppuccin").setup({
      flavour = "mocha", -- "mocha", "latte", "frappe", "macciato"
      transparent_background = true,
      integrations = {
        treesitter = true,
        lsp = true,
      },
    })
    vim.cmd([[colorscheme catppuccin]])
  end,
}
