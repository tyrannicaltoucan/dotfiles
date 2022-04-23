local special_settings = vim.api.nvim_create_augroup("SpecialSettings", {})

vim.api.nvim_create_autocmd("TermOpen", {
    group = special_settings,
    desc = "Terminal tweaks",
    callback = function()
        vim.cmd("startinsert")
        vim.opt_local.cursorcolumn= false
        vim.opt_local.number = false
    end
})

local filetype_settings = vim.api.nvim_create_augroup("FileTypeSettings", {})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    group = filetype_settings,
    desc = "GLSL filetypes",
    pattern = { "*.fs", "*.vs", "*.frag", "*.vert", "*.glsl" },
    callback = function()
        vim.opt_local.filetype = "glsl"
    end
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    group = filetype_settings,
    desc = "Clang configuration filetypes",
    pattern = { ".clang-tidy", ".clang-format" },
    callback = function()
        vim.opt_local.filetype = "yaml"
    end
})
