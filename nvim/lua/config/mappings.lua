local map = require("helpers").map

vim.g.mapleader = " "

-- window navigation
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

-- split creation
map("n", "sh", ":split<CR><C-w>w")
map("n", "sv", ":vsplit<CR><C-w>w")

-- resize splits
map("n", "<C-Up>", ":resize -2<CR>")
map("n", "<C-Down>", ":resize +2<CR>")
map("n", "<C-Left>", ":vertical resize +2<CR>")
map("n", "<C-Right>", ":vertical resize -2<CR>")

-- buffer navigation
map("n", "<leader>bn", ":bnext<CR>")
map("n", "<leader>bp", ":bprevious<CR>")
map("n", "<leader>bd", ":bdelete<CR>")

-- trim whitespace
map("n", "cw", [[:lua require("helpers").trim_whitespace()<CR>]])
