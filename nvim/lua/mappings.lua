local keymap = require('utils').keymap

-- use gj/gk by default to better navigation on wrapped lines
keymap('n', 'j', 'gj')
keymap('n', 'k', 'gk')

-- trim trailing whitespace
keymap('n', 'cw', [[:lua require('utils').buf_trim_whitespace()<CR>]])

-- move selected lines
keymap('v', '<c-j>', [[:m '>+1<CR>gv=gv]])
keymap('v', '<c-k>', [[:m '<-2<CR>gv=gv]])

-- easier exiting from terminal
keymap('t', [[<esc><esc>]], [[<c-\><c-n>]])

-- open terminals
keymap('n', '<leader>th', [[:exec 15 .. 'new +terminal' <CR>]])
keymap('n', '<leader>tv', [[:exec 'vnew +terminal' <CR>]])
keymap('n', '<leader>tw', [[:exec 'terminal' <CR>]])

-- buffer handling
keymap('n', '<leader>b]', ':bnext <CR>')
keymap('n', '<leader>b[', ':bprev <CR>')
keymap('n', '<leader>bd', ':bdelete <CR>')
keymap('n', '<leader>bo', ':w | %bd | e# | bd# <CR>')

-- split navigation
keymap('n', '<C-h>', '<C-w>h <CR>')
keymap('n', '<C-j>', '<C-w>j <CR>')
keymap('n', '<C-k>', '<C-w>k <CR>')
keymap('n', '<C-l>', '<C-w>l <CR>')

-- disable ex mode
keymap('n', 'Q', '<nop>')
