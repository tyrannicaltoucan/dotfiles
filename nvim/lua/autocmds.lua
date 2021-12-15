local augroup = require('utils').augroup

-- use italics on any colorscheme
augroup('ForceItalics', {
    { 'ColorScheme', '*', 'highlight Comment cterm=italic gui=italic' },
    { 'ColorScheme', '*', 'highlight SpeicalComment cterm=italic gui=italic' },
})

-- configure terminal startup
augroup('TermStartup', {
    { 'TermOpen', '*', [[setlocal nocursorcolumn signcolumn=no colorcolumn=0 nonumber listchars=]] },
    { 'TermOpen', '*', 'startinsert' },
})
