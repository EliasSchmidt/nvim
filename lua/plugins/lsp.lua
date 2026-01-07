local on_attach = function(client, bufnr)
  local bufmap = function(mode, lhs, rhs, desc)
    vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, { noremap = true, silent = true, desc = desc })
  end

  bufmap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", "Go to Definition")
  bufmap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", "Go to Implementation")
  bufmap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", "Show References")
  bufmap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", "Hover Info")
  bufmap("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", "LSP: Code Action")
end

return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },

  config = function()
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    local servers = { "clangd", "ts_ls", "html", "cssls", "jsonls", "lua_ls" }

    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = servers,
      automatic_installation = true,
    })


    for _, server in ipairs(servers) do
      vim.lsp.config(
        server,
        {on_attach = on_attach},
        capabilities
      )
    end
  end,
}
