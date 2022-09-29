require("nvim-treesitter.configs").setup {
  highlight = { enable = true },
  indent = { enable = true },
  ensure_installed = { "bash", "c", "cmake", "cpp", "lua", "rust" },
}
