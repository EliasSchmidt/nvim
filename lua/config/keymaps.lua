local sk = vim.keymap.set

sk({"n", "v", "x"}, "<leader>w", "<cmd>w<cr>", { noremap = true, silent = true, desc = "speichern"})
