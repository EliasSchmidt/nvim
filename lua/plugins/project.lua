return {
  "coffebar/neovim-project",
  event = "VeryLazy",

  dependencies = {
    {
      "Shatur/neovim-session-manager",

      config = function()
        require("session_manager").setup({
          sessions_dir = vim.fn.stdpath("data") .. "/sessions",
          autoload_mode = require("session_manager.config").AutoloadMode.Disabled,
          autosave_last_session = true,
          autosave_ignore_not_normal = true,
        })
      end,
    },
  },

  opts = {
    projects = {
      "~/.config/*",
      "~/dev/*",
      "~/dev/*/*",
      "~/documents/vault"
    },
    last_project_cd = true, 
    session_manager_opts = {
      autosave_ignore_not_normal = true,
      autosave_ignore_dirs = {},
    },
    picker = { 
      type = "telescope",

      preview = {
        enabled = true,
        git_status = true,
        git_fetch = true,
        show_hidden = true,
    }},
  },

  config = function(_, opts)
    require("neovim-project").setup(opts)
  end,

  keys = {
    { "<leader>fp", "<cmd>NeovimProjectDiscover<cr>", desc = "Find Project" },
  }
}
