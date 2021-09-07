require("indent_blankline").setup {
    char = "▏",
    show_trailing_blankline_indent = false,
    use_treesitter = true,
    filetype_exclude = { "help", "gitcommit", "text", "packer" },
    buftype_exclude = { "terminal", "nofile" }
}
