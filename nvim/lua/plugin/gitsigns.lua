require("gitsigns").setup {
  signs = {
    add = { hl = "GitSignsAdd", text = "│" },
    change = { hl = "GitSignsChange", text = "│" },
    delete = { hl = "GitSignsDelete", text = "│" },
    topdelete = { hl = "GitSignsDelete", text = "‣" },
    changedelete = { hl = "GitSignsChangeDelete", text = "┃" },
  },
  on_attach = function(bufnr)
    local map = require("helpers").map
    local gitsigns = package.loaded.gitsigns

    map({"n", "v"}, "<leader>hs", ":Gitsigns stage_hunk<CR>")
    map({"n", "v"}, "<leader>hr", ":Gitsigns reset_hunk<CR>")
    map("n", "<leader>hu", gitsigns.undo_stage_hunk)
    map("n", "<leader>hp", gitsigns.preview_hunk)
  end
}
