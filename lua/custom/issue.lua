local M = {}

function M.open()
  vim.notify(vim.env.HOME)
  local bufnr = vim.fn.bufadd("~/.config/nvim/TODO.md")
  vim.fn.bufload(bufnr)
  vim.api.nvim_open_win(bufnr, true, {
    relative = "editor",
    width = 60,
    height = 20,
    row = 5,
    col = 10
  }
)

end

return M
