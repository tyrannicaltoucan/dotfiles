require('gitsigns').setup {
    max_file_length = 1500,
    keymaps = {
        buffer = true,
        ['n <leader>h]'] = [[<cmd>lua require('gitsigns').next_hunk({wrap = true})<cr>zz]],
        ['n <leader>h['] = [[<cmd>lua require('gitsigns').prev_hunk({wrap = true})<cr>zz]],
        ['n <leader>h+'] = [[<cmd>lua require('gitsigns').stage_hunk()<cr>]],
        ['n <leader>h-'] = [[<cmd>lua require('gitsigns').reset_hunk()<cr>]],
        ['n <leader>hp'] = [[<cmd>lua require('gitsigns').preview_hunk()<cr>]],
        ['n <leader>hb'] = [[<cmd>lua require('gitsigns').blame_line()<cr>]],
        ['n <leader>hr'] = [[<cmd>lua require('gitsigns').refresh()<cr>]]
    }
}
