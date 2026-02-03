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

    -- find files git nicht mehr nutzen, da ich auch untracked sehen will und mit fd find auch so schnell ist
    -- local function smart_find_files()
    --   local is_git = vim.fs.find(".git", {
    --     path = vim.loop.cwd(),
    --     upward = true,
    --     type = "directory"
    --   })[1]
    --
    --   if is_git then
    --     vim.notify("Git gefunden in: " .. is_git, vim.log.levels.INFO)
    --     ts.git_files()
    --   else
    --     ts.find_files()
    --   end
    -- end

    local function lsp_symbols()
      ts.lsp_document_symbols({
        default_text = "function",
        initial_mode = "normal"
      })
    end

    local function fd()
      ts.find_files({find_command = {"fdfind", "--type", "f", "--strip-cwd-prefix", "--hidden"}})
    end

    local function fd_all()
      ts.find_files({find_command = {"fdfind", "--type", "f", "--strip-cwd-prefix", "--hidden", "--no-ignore-parent", "--no-ignore", "--exclude", ".git"}})
    end


    -- Keymaps
    local map = vim.keymap.set
    map("n", "<leader>ff", fd, { desc = "Find Project Files" })
    map("n", "<leader>fa", fd_all, { desc = "Find all Project Files" })
    map("n", "<leader>fg", function () ts.live_grep() end, { desc = "Search Text in Project" })
    map("n", "<leader>fb", function () ts.buffers({initial_mode = "normal"}) end, { desc = "Open Buffers" })
    map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "Help Tags" })
    map("n", "<leader>flf", lsp_symbols, { desc = "Lsp functions" })
    map("n", "<leader>fls", function () ts.lsp_document_symbols() end, { desc = "Lsp Symbols" })
  end,
}
