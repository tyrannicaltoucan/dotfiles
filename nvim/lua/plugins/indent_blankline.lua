require("indent_blankline").setup {
    char = "▏",
    show_first_indent_level = false,
    show_trailing_blankline_indent = false,
    use_treesitter = true,
    filetype_exclude = { "help", "gitcommit", "text", "packer" },
    buftype_exclude = { "terminal", "nofile" }
}
