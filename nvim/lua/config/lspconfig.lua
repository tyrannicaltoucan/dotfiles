local lspconfig = require("lspconfig")

vim.diagnostic.config {
    float = { source = "always", style = "minimal" },
    signs = true,
    virtual_text = false,
}

local signs = { Error = "", Warn = "", Info = "", Hint = "" }
for type, icon in pairs(signs) do
    local hl_name = "DiagnosticSign" .. type
    vim.fn.sign_define(hl_name, { texthl = hl_name, text = icon, numhl = "" })
end

local on_attach = function(client, bufnr)
    local buf_map = require("utilities").buf_map

    buf_map(bufnr, "n", "ga", "<cmd>lua vim.lsp.buf.code_action()<CR>")
    buf_map(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>")
    buf_map(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
    buf_map(bufnr, "n", "g[", "<cmd>lua vim.diagnostic.goto_prev()<CR>")
    buf_map(bufnr, "n", "g]", "<cmd>lua vim.diagnostic.goto_next()<CR>")
    buf_map(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
    buf_map(bufnr, "n", "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>")
    buf_map(bufnr, "n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>")
    buf_map(bufnr, "n", "gR", "<cmd>lua vim.lsp.buf.rename()<CR>")
    buf_map(bufnr, "n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
    buf_map(bufnr, "n", "gF", "<cmd>lua vim.lsp.buf.formatting()<CR>")
    buf_map(bufnr, "n", "gf", "<cmd>lua vim.lsp.buf.range_formatting()<CR>")

    if client.name == "clangd" then
        buf_map(bufnr, "n", "gh", "<cmd>ClangdSwitchSourceHeader<CR>")
    end
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

local servers = {
    clangd = { cmd = { "clangd", "--header-insertion=never" } },
    rust_analyzer = {}
}

for server, config in pairs(servers) do
    config.capabilities = capabilities
    config.on_attach = on_attach
    lspconfig[server].setup(config)
end
