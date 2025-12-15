local on_attach = function(client, bufnr)
  local bufmap = function(mode, lhs, rhs, desc)
    vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, { noremap = true, silen = true, desc = desc })
  end

  bufmap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", "Go to Definition")
  bufmap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", "Show References")
  bufmap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", "Hover Info")
end

return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = {
        "ts_ls", "html", "cssls", "jsonls"
      },
      automatic_installation = true,
    })

    local lsp = vim.lsp

    lsp.config("ts_ls", { on_attach = on_attach})
    lsp.enable("ts_ls")
    lsp.enable("html")
    lsp.enable("cssls")
    lsp.enable("jsonls")
  end,
}
