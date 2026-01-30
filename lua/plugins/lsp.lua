local on_attach = function(client, bufnr)
  local bufmap = function(mode, lhs, rhs, desc)
    vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, noremap = true, silent = true, desc = desc })
  end


  local telescope = require("telescope.builtin")

  local custom_ref = function ()
    telescope.lsp_references({
      initial_mode = "normal"
    })
  end

  local custom_def = function ()
    telescope.lsp_definitions({
      initial_mode = "normal"
    })
  end


  bufmap("n", "gd", custom_def, "Go to Definition")
  bufmap("n", "gi", vim.lsp.buf.implementation, "Go to Implementation")
  bufmap("n", "<leader>fr", custom_ref, "Find References")
  bufmap("n", "K", function() vim.lsp.buf.hover({border = "rounded"}) end, "Hover Info")
  bufmap("n", "<leader>ca", vim.lsp.buf.code_action, "LSP: Code Action")
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
