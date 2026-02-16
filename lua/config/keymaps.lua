local sk = vim.keymap.set

sk({"n", "v", "x"}, "<leader>w", "<cmd>w<cr>", { noremap = true, silent = true, desc = "speichern"})
-- sk('n', '<leader>rs', ':restart<CR>', { desc = 'Neovim Neustart' })
sk('n', '<leader>ri', function() require('custom.issue').open() end, { desc = "Öffne Config TODO.md" })
sk('i', '<c-h>', '<c-w>')
sk({'n', 'v', 'x'}, 'j', 'gj')
sk({'n', 'v', 'x'}, 'k', 'gk')
sk('n', "<esc>", "<cmd>nohlsearch<CR>", { desc = "Search Highlight entfernen" })
