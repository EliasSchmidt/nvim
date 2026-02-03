return {
  "nvim-neo-tree/neo-tree.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
    "3rd/image.nvim"
  },
  keys = {
    {"<leader>e", "<cmd>Neotree float reveal<cr>", desc = "File Explorer" }
  },
  opts = {
    filesystem = {
      follow_current_file = {
        enabled = true,
        leave_dirs_open = true,
      },
      filtered_items = {
        visible = true,
      },
      use_libuv_file_watcher = true,
    },
    window = {
      position = "float"
    }
  }
}
