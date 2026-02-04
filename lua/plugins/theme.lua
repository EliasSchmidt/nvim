return {
  "catppuccin/nvim",
  config = function()
    require("catppuccin").setup({
      flavour = "mocha", -- "mocha", "latte", "frappe", "macciato"
      transparent_background = true,
      integrations = {
        flash = true,
        treesitter = true,
        lsp = { enabled = true, borders = true },
        mason = true,
        telescope = true
      },
    })
    vim.cmd([[colorscheme catppuccin]])
  end,
}
