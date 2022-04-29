require("nvim-treesitter.configs").setup {
    ensure_installed = { "bash", "c", "cmake", "comment", "cpp", "lua", "glsl", "rust" },
    autopairs = { enable = true },
    highlight = { enable = true },
    indent = {
        enable = true,
        disable = { "c", "cpp" }, -- use clang-format instead
    },
}
