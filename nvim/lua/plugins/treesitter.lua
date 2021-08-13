require('nvim-treesitter.configs').setup {
    ensure_installed = {'bash', 'c', 'cpp', 'lua', 'python' },
    highlight = {
        enable = true
    },
    incremental_selection = {
        enable = true
    },
    indent = {
        enable = true,
        disable = { 'c', 'cpp' } -- 'clang-format' is used instead
    }
}
