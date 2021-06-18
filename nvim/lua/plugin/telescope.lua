local telescope = require('telescope')
local actions = require('telescope.actions')

telescope.setup {
    defaults = {
        mappings = {
            n = {['<esc>'] = actions.close}
        },
    },
    pickers = {
        find_files = {theme = 'dropdown', previewer = false},
        lsp_code_actions = {theme = 'dropdown', previewer = false}
    }
}

local opts = { noremap=true, silent=true }
vim.api.nvim_set_keymap('n', '<leader>ff', '<cmd>Telescope find_files<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>fb', '<cmd>Telescope buffers<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>fs', '<cmd>Telescope git_status<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>fa', '<cmd>Telescope lsp_code_actions<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>fd', '<cmd>Telescope lsp_document_diagnostics<CR>', opts)
