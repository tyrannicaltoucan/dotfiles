require("indent_blankline").setup {
  char = "▏",
  show_trailing_blankline_indent = false,
  filetype_exclude = { "gitcommit", "packer", "help" },
  buftype_exclude = { "terminal", "nofile" },
}
