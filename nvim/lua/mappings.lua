local map = require("utilities").map

-- Use spacebar as leader key
vim.g.mapleader = " "

-- Better split navigation
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

-- Resize splits using arrows
map("n", "<C-Up>", "<cmd>resize -2<CR>")
map("n", "<C-Down>", "<cmd>resize +2<CR>")
map("n", "<C-Left>", "<cmd>vertical resize -2<CR>")
map("n", "<C-Right>", "<cmd>vertical resize +2<CR>")

-- Buffer handling
map("n", "<leader>bn", "<cmd>bnext<CR>")
map("n", "<leader>bp", "<cmd>bprevious<CR>")
map("n", "<leader>bd", "<cmd>bdelete<CR>")

-- Open terminal
map("n", "<C-t>", [[:exec 10 .. "new +terminal"<CR>]])

-- Trim trailing whitespace
map("n", "cw", [[<cmd>lua require("utilities").buf_trim_whitespace()<CR>]])

-- Move text up and down
map("v", "<C-j>", [[<cmd>move ">+1<CR>gv=gv]])
map("v", "<C-k>", [[<cmd>move "<-2<CR>gv=gv]])
map("x", "<C-j>", [[<cmd>move ">+1<CR>gv=gv]])
map("x", "<C-k>", [[<cmd>move "<-2<CR>gv=gv]])

-- Telescope
map("n", "<leader>ff", "<cmd>Telescope find_files<CR>")
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>")
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>")
map("n", "<leader>fw", "<cmd>Telescope live_grep<CR>")

-- NvimTree
map("n", "<leader>te", "<cmd>NvimTreeToggle<CR>")
map("n", "<leader>tf", "<cmd>NvimTreeFocus<CR>")
map("n", "<leader>tr", "<cmd>NvimTreeRefresh<CR>")
