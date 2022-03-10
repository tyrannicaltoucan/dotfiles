require("gitsigns").setup {
    max_file_length = 1500,
    signs = {
        add = { hl = "GitSignsAdd", text = "│" },
        change = { hl = "GitSignsChange", text = "│" },
        delete = { hl = "GitSignsDelete", text = "│" },
        topdelete = { hl = "GitSignsDelete", text = "‣" },
        changedelete = { hl = "GitSignsChangeDelete", text = "┃" },
    },
    on_attach = function(bufnr)
        local buf_map = require("utilities").buf_map

        buf_map(bufnr, "n", "]c", [[&diff ? "]c" : "<cmd>Gitsigns next_hunk<CR>"]], { expr=true })
        buf_map(bufnr, "n", "[c", [[&diff ? "[c" : "<cmd>Gitsigns prev_hunk<CR>"]], { expr=true })
        buf_map(bufnr, "n", "<leader>hs", "<cmd>Gitsigns stage_hunk<CR>")
        buf_map(bufnr, "v", "<leader>hs", "<cmd>Gitsigns stage_hunk<CR>")
        buf_map(bufnr, "n", "<leader>hr", "<cmd>Gitsigns reset_hunk<CR>")
        buf_map(bufnr, "v", "<leader>hr", "<cmd>Gitsigns reset_hunk<CR>")
        buf_map(bufnr, "n", "<leader>hu", "<cmd>Gitsigns undo_stage_hunk<CR>")
        buf_map(bufnr, "v", "<leader>hp", "<cmd>Gitsigns preview_hunk<CR>")
    end
}
