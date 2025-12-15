return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
    },
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    telescope.setup({
      defaults = {
        mappings = {
          i = {
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
          },
        },
        sorting_strategy = "ascending",
        layout_config = {
          prompt_position = "top",
        },
      },
    })

    -- Sicheres Laden der Extension (crasht nicht mehr!)
    pcall(function()
      telescope.load_extension("fzf")
    end)

    -- Keymaps
    local map = vim.keymap.set
    map("n", "<leader>ff", "<cmd>Telescope git_files<CR>", { desc = "Find Project Files (Git)" })
    map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { desc = "Search Text in Project" })
    map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "Open Buffers" })
    map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "Help Tags" })
  end,
}
