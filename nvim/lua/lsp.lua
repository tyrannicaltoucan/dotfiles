local lsp = require("lspconfig")
local keyopts = { noremap = true, silent = true }
local buf_keymap = vim.api.nvim_buf_set_keymap

local lsp_on_init = function(client)
    client.config.flags = client.config.flags or {}
    client.config.flags.allow_incremental_sync = true
    client.config.flags.debounce_text_changes = 500
end

vim.fn.sign_define("LspDiagnosticsSignError", {text = "•"})
vim.fn.sign_define("LspDiagnosticsSignWarning", {text = "•"})
vim.fn.sign_define("LspDiagnosticsSignInformation", {text = "•"})
vim.fn.sign_define("LspDiagnosticsSignHint", {text = "•"})

local lsp_on_attach = function(client, bufnr)
    vim.opt_local.signcolumn = "yes"

    buf_keymap(bufnr, "n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", keyopts)
    buf_keymap(bufnr, "n", "<leader>ld", "<cmd>lua vim.lsp.buf.definition()<cr>", keyopts)
    buf_keymap(bufnr, "n", "<leader>lh", "<cmd>lua vim.lsp.buf.hover()<cr>", keyopts)
    buf_keymap(bufnr, "n", "<leader>li", "<cmd>lua vim.lsp.buf.implementation()<cr>", keyopts)
    buf_keymap(bufnr, "n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", keyopts)
    buf_keymap(bufnr, "n", "<leader>lp", "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>", keyopts)
    buf_keymap(bufnr, "n", "<leader>ln", "<cmd>lua vim.lsp.diagnostic.goto_next()<cr>", keyopts)

    -- Some LSPs don't support formatting
    if client.resolved_capabilities.document_formatting then
        buf_keymap(bufnr, "n", "<leader>lF", "<cmd>lua vim.lsp.buf.formatting()<cr>", keyopts)
    elseif client.resolved_capabilities.document_range_formatting then
        buf_keymap(bufnr, "n", "<leader>lf", "<cmd>lua vim.lsp.buf.range_formatting()<cr>", keyopts)
    end
end

-- LSP Server configuration
-------------------------------------------------------

-- clangd
lsp.clangd.setup {
    cmd = { "clangd", "--background-index", "--header-insertion=never", "--clang-tidy" },
    on_init = lsp_on_init,
    on_attach = function(client, bufnr)
        buf_keymap(bufnr, "n", "<leader>lg", "<cmd>ClangdSwitchSourceHeader<cr>", keyopts)
        lsp_on_attach(client, bufnr)
    end
}

-- cmake-language-server
lsp.cmake.setup {
    on_init = lsp_on_init,
    on_attach = lsp_on_attach
}

-- rust-analyzer
lsp.rust_analyzer.setup {
    on_init = lsp_on_init,
    on_attach = lsp_on_attach
}
