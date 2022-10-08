local lspconfig = require("lspconfig")

local capabilities = require('cmp_nvim_lsp').update_capabilities(
  vim.lsp.protocol.make_client_capabilities()
)

local on_attach = function(client, bufnr)
  local map = require("helpers").map
  local opts = { buffer = bufnr }

  map("n", "K", vim.lsp.buf.hover, opts)
  map("n", "ga", vim.lsp.buf.code_action, opts)
  map("n", "gd", vim.lsp.buf.definition, opts)
  map("n", "gi", vim.lsp.buf.implementation, opts)
  map({"n", "v"}, "gf", vim.lsp.buf.format, opts)
  map("n", "gn", vim.lsp.buf.rename, opts)
  map("n", "gl", vim.diagnostic.open_float, opts)
  map("n", "[d", vim.diagnostic.goto_prev, opts)
  map("n", "]d", vim.diagnostic.goto_next, opts)

  if client.name == "clangd" then
    map("n", "gs", ":ClangdSwitchSourceHeader<cr>", opts)
  end
end

lspconfig.clangd.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "clangd", "--background-index", "--limit-results=250", "--header-insertion=never" },
}
