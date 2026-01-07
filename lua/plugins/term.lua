return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup({
      size = 20,
      direction = "float",
      float_opts = {
         border = "curved",
      },
      start_in_insert = true,
      persist_mode = false,
      modifieable = true,
    })

    vim.keymap.set('n', '<leader>t', '<cmd>ToggleTerm<cr>', { desc = "Toggle Term" })

    function _G.set_terminal_keymaps()
      local opts =  {buffer = 0}
      local k = vim.keymap.set

      k('t', '<esc>', [[<C-\><C-n>]], opts)
      k('n', '<esc>', '<cmd>ToggleTerm<cr>', opts)
    end

    vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
  end
}
