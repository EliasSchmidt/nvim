local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	require("plugins.treesitter"),
  require("plugins.completion"),
  require("plugins.lsp"),
  require("plugins.theme"),
  require("plugins.telescope"),
  require("plugins.whichkey"),
  require("plugins.icons"),
  require("plugins.term"),
  require("plugins.lualine"),
  require("plugins.project"),
})
