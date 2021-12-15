require('nvim-treesitter.configs').setup {
    ensure_installed = { 'bash', 'c', 'cmake', 'comment', 'cpp', 'lua', 'python', 'rust', 'zig' },
    highlight = { 
        enable = true 
    },
    indent = { 
        enable = true, 
        disable = { 'c', 'cpp' } -- use clang-format instead
    }
}
