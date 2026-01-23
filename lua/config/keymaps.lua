local sk = vim.keymap.set

sk({"n", "v", "x"}, "<leader>w", "<cmd>w<cr>", { noremap = true, silent = true, desc = "speichern"})
-- sk('n', '<leader>rs', ':restart<CR>', { desc = 'Neovim Neustart' })
sk('n', '<leader>ri', function() require('custom.issue').open() end, { desc = "Öffne Config TODO.md" })
