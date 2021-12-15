local keymap = require('utils').keymap
local telescope = require('telescope')

telescope.load_extension('fzy_native')
telescope.setup {
    defaults = {
        prompt_prefix = ' ',
        selection_caret = ' ',
        layout_config = {
            horizontal = {
                width = 0.8,
                preview_width = 0.6
            },
            vertical = {
                width = 0.7,
                preview_width = 0.5
            },
        },
        file_sorter = require('telescope.sorters').get_fzy_sorter,
        generic_sorter = require('telescope.sorters').get_generic_fuzzy_sorter,
    },
    extensions = {
        fzy_native = {
            override_generic_sorter = true,
            override_file_sorter = true,
        }
    }
}

keymap('n', '<leader>ff', '<cmd>Telescope find_files<CR>')
keymap('n', '<leader>fb', '<cmd>Telescope buffers<CR>')
keymap('n', '<leader>fg', '<cmd>Telescope live_grep<CR>')
keymap('n', '<leader>fh', '<cmd>Telescope help_tags<CR>')
