return {
  "3rd/image.nvim",
  build = false,
  lazy = false,
  opts = {
    backend = "kitty",

    hijack_file_patterns = {
      "*.png",
      "*.jpg",
      "*.jpeg",
      "*.gif",
      "*.webp",
      "*.avif",
    },

    max_height_window_percentage = 50,
    
    -- Integrations (Bilder in Markdown etc.)
    integrations = {
      markdown = {
        enabled = true,
        clear_in_insert_mode = false,
        download_remote_images = true,
        only_render_image_at_cursor = false,
      },
    },

    -- Ghostty-spezifisch: Overlap vermeiden
    window_overlap_clear_enabled = true,
    window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },

    editor_only_render_when_focused = true,
  },
}
