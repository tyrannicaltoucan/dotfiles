vim.opt.completeopt = { "menuone", "noselect" }

require("compe").setup {
    preselect = "disable",
    incomplete_delay = 500,
    documenation = false,
    source = {
        path = false,
        buffer = true,
        calc = false,
        nvim_lsp = true,
        nvim_lua = true,
    }
}

local opts = { expr = true, noremap = true, silent = true }
vim.api.nvim_set_keymap("i", "<C-Space>", [[compe#complete()]], opts)
vim.api.nvim_set_keymap("i", "<C-e>",   [[compe#close("<C-e>")]], opts)
