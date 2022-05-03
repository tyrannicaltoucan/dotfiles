local filename = {
    "filename",
    symbols = { modified = " ", readonly = " " },
}

local diagnostics = {
    "diagnostics",
    sections = { "error", "warn"  },
    symbols = { error = " ", warn = " " },
    colored = false,
    always_visible = true,
    cond = function()
        return next(vim.lsp.buf_get_clients(0)) ~= nil
    end,
}

require("lualine").setup {
    options = {
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
