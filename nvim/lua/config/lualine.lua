local colorscheme = require("kanagawa.colors").setup()

local colors = {
    white = colorscheme.oldWhite,
    black = colorscheme.sumiInk0,
    lo_gray = colorscheme.sumiInk2,
    hi_gray = colorscheme.katanaGray,
    red = colorscheme.peachRed,
    green = colorscheme.springGreen,
    yellow = colorscheme.carpYellow,
    blue = colorscheme.springBlue,
    violet = colorscheme.springViolet1,
}

local theme = {
    normal = {
        a = { fg = colors.black, bg = colors.blue, gui="bold" },
        b = { fg = colors.white, bg = colors.lo_gray },
        c = { fg = colors.hi_gray, bg = colors.black },
    },

    insert = { a = { fg = colors.black, bg = colors.green, gui="bold"}},
    visual = { a = { fg = colors.black, bg = colors.violet, gui="bold" }},
    replace = { a = { fg = colors.black, bg = colors.red, gui="bold" }},
    command = { a = { fg = colors.black, bg = colors.yellow, gui="bold" }},

    inactive = {
        a = { bg = colors.black, fg = colors.hi_gray },
        b = { bg = colors.black, fg = colors.hi_gray },
        c = { bg = colors.black, fg = colors.hi_gray },
    },
}

local filename = {
    "filename",
    path = 1,
    symbols = { modified = " ", readonly = " " },
}

local diagnostics = {
    "diagnostics",
    sections = { "error", "warn", "info" },
    symbols = { error = " ", warn = " ", info = " " },
    colored = false,
    always_visible = true,
    cond = function()
        return next(vim.lsp.buf_get_clients(0)) ~= nil
    end,
}

require("lualine").setup {
    options = {
        theme = theme,
        component_separators = "",
        section_separators = { left = "", right = "" },
    },
    sections = {
        lualine_a = { "mode" },
        lualine_b = { filename },
        lualine_c = { diagnostics },
        lualine_x = {{ "filetype", colored = false }},
        lualine_y = { "location" },
        lualine_z = { "%P" },
    },
    inactive_sections = {
        lualine_a = { filename },
        lualine_b = {},
        lualine_c = {},
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
    },
}
