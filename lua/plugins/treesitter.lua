return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  opts = {
    ensure_installed = { "c", "javascript", "typescript", "html", "css", "tsx", "json", "lua", "java" },
    auto_install = true;
    highlight = { enable = true },
    indent = { enable = true },
  }
}
