local autocmd = vim.api.nvim_create_autocmd
autocmd("CursorHold", {
  callback = function()
    vim.diagnostic.open_float(nil, {
      focusable = false,
      border = "rounded",
      scope = "cursor"
    })
  end
})

autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    local opt = vim.opt_local
    opt.wrap = true
    opt.linebreak = true
    opt.breakindent = true
  end,
})
