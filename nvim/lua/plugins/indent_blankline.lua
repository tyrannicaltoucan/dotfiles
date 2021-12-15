require('indent_blankline').setup {
    char = '▏',
    use_treesitter = true,
    filetype_exclude = { 'help', 'gitcommit', 'text', 'packer' },
    buftype_exclude = { 'terminal', 'nofile' }
}
