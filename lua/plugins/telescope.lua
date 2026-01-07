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


    pcall(function()
      telescope.load_extension("fzf")
    end)

    local ts = require("telescope.builtin")

    local function smart_find_files()
      local is_git = vim.fs.find(".git", {
        path = vim.loop.cwd(),
        upward = true,
        type = "directory"
      })[1]

      if is_git then
        vim.notify("Git gefunden in: " .. is_git, vim.log.levels.INFO)
        ts.git_files()
      else
        ts.find_files()
      end
    end

    local function lsp_symbols()
      ts.lsp_document_symbols({
        default_text = "function"
      })
    end

    -- Keymaps
    local map = vim.keymap.set
    map("n", "<leader>ff", smart_find_files, { desc = "Find Project Files" })
    map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { desc = "Search Text in Project" })
    map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "Open Buffers" })
    map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "Help Tags" })
    map("n", "<leader>flf", lsp_symbols, { desc = "Lsp functions" })
    map("n", "<leader>fls", "<cmd>Telescope lsp_document_symbols<CR>", { desc = "Lsp Symbols" })
  end,
}
