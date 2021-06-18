local lspconfig = require('lspconfig')

local on_attach = function(client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local opts = { noremap=true, silent=true }

    -- Set buffer specific options
    vim.opt.signcolumn = 'yes'

    buf_set_keymap('n', '<leader>la', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    buf_set_keymap('n', '<leader>ld', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', '<leader>lh', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', '<leader>li', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', '<leader>lr', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', 'd[', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap('n', 'd]', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)

    if vim.fn.exists('ClangdSwitchSourceHeader') then
        buf_set_keymap('n', '<leader>ls', '<cmd>ClangdSwitchSourceHeader<CR>', opts)
    end

    if client.resolved_capabilities.document_formatting then
        buf_set_keymap('n', '<leader>lf', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
    elseif client.resolved_capabilities.document_range_formatting then
        buf_set_keymap('n', '<leader>lF', '<cmd>lua vim.lsp.buf.range_formatting()<CR>', opts)
    end
end

lspconfig.clangd.setup {
    cmd = {'clangd', '--header-insertion=never', '--suggest-missing-includes'},
    init_options = { clangdFileStatus = true },
    on_attach = on_attach
}
