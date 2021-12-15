local fn = vim.fn
local lsp = require('lspconfig')
local buf_keymap = require('utils').buf_keymap

local diag_types = { 'Error', 'Warn', 'Info', 'Hint' }
for _, type in ipairs(diag_types) do
    local hl = 'DiagnosticSign' .. type
    fn.sign_define(hl, { text = '', texthl = hl })
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = {
        'documentation',
        'detail',
        'additionalTextEdits',
    }
}

local lsp_flags = {
    debounce_text_changes = 300,
    allow_incremental_sync = true,
}

local lsp_on_attach = function(client, bufnr)
    buf_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
    buf_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
    buf_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
    buf_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>')
    buf_keymap(bufnr, 'n', 'gR', '<cmd>lua vim.lsp.buf.rename()<CR>')
    buf_keymap(bufnr, 'n', 'gI', '<cmd>lua vim.lsp.buf.implementation()<CR>')
    buf_keymap(bufnr, 'n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
    buf_keymap(bufnr, 'n', 'gl', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>')
    buf_keymap(bufnr, 'n', 'ga', '<cmd>lua vim.lsp.buf.code_action()<CR>')
    buf_keymap(bufnr, 'n', 'g[', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>')
    buf_keymap(bufnr, 'n', 'g]', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>')

    if client.resolved_capabilities.document_formatting then
        buf_keymap(bufnr, 'n', 'gF', '<cmd>lua vim.lsp.buf.formatting()<CR>')
    end

    if client.resolved_capabilities.document_range_formatting then
        buf_keymap(bufnr, 'n', 'gf', '<cmd>lua vim.lsp.buf.range_formatting()<CR>')
    end
end

lsp.clangd.setup {
    cmd = { 'clangd', '--header-insertion=never' },
    capabilities = capabilities,
    flags = lsp_flags,
    on_attach = function(client, bufnr)
        buf_keymap(bufnr, 'n', 'gh', '<cmd>ClangdSwitchSourceHeader<CR>')
        lsp_on_attach(client, bufnr)
    end
}

lsp.rust_analyzer.setup {
    capabilities = capabilities,
    flags = lsp_flags,
    on_attach = lsp_on_attach
}
