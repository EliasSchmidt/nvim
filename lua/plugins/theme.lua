return {
  "catppuccin/nvim",
  config = function()
    require("catppuccin").setup({
      flavour = "macchiato", -- "mocha", "latte", "frappe", "macciato"
      transparent_background = false,
      integrations = {
        treesitter = true,
        lsp = true,
      },
    })
    vim.cmd([[colorscheme catppuccin]])
  end,
}
