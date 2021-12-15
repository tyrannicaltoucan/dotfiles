local opt = vim.opt
local g = vim.g

-- use spacebar as leader
g.mapleader = ' '

opt.backup = false
opt.clipboard = 'unnamedplus'
opt.colorcolumn = { 101 }
opt.cursorline = true
opt.ignorecase = true
opt.inccommand = 'nosplit'
opt.list = true
opt.listchars = { trail = '·', tab = '→ ' }
opt.hidden = true
opt.mouse = 'a'
opt.number = true
opt.pumheight = 10
opt.scrolloff = 10
opt.signcolumn = 'yes'
opt.smartcase = true
opt.splitbelow = true
opt.splitright = true
opt.swapfile = false
opt.timeoutlen = 500
opt.textwidth = 100
opt.undofile = true
opt.updatetime = 250
opt.wrap = false
opt.writebackup = false

-- indentation settings
local indent_width = 4
opt.expandtab = true
opt.shiftround = true
opt.softtabstop = indent_width
opt.shiftwidth = indent_width

-- statusline
opt.statusline = ' %<%f %M %R %= %l/%L (%P) %*'
