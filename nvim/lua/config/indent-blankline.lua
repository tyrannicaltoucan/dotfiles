require("indent_blankline").setup {
    char = "▏",
    show_trailing_blankline_indent = false,
    filetype_exclude = { "help", "markdown", "gitcommit", "text", "packer", "NvimTree" },
    buftype_exclude = { "terminal", "nofile" },
}
