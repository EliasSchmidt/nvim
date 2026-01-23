local sk = vim.keymap.set

sk({"n", "v", "x"}, "<leader>w", "<cmd>w<cr>", { noremap = true, silent = true, desc = "speichern"})
sk('n', '<leader>rs', ':source $MYVIMRC<CR>', { desc = 'Neovim Neustart' })
