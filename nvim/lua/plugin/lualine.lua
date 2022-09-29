local filetype = {
  "filetype",
  icon_only = true,
  colored = false,
  padding = { left = 1, right = 0 },
}

local filename = {
  "filename",
  symbols = { modified = "", readonly = "" },
}

local branch = {
  "branch",
  icon = "",
  separator = "",
  color = { gui = "italic" },
}

local mode = {
  "mode",
  color = { gui = "bold" },
}

local diagnostics = {
  "diagnostics",
  separator = "",
  colored = false,
  sections = { "error", "warn", "info" },
  symbols = { error = " ", warn = " ", info = " " },
  always_visible = true,
  cond = function()
    -- Keep all diagnostic levels visible, unless there is no LSP available.
    return next(vim.lsp.buf_get_clients(0)) ~= nil
  end,
}

require("lualine").setup {
  options = {
    theme = "auto",
    section_separators = { left = "", right = "" },
    component_separators = { left = "", right = "" },
  },
  sections = {
    lualine_a = { mode },
    lualine_b = { },
    lualine_c = { branch, filetype, filename },
    lualine_x = { diagnostics, "location" },
    lualine_y = { },
    lualine_z = { "%P" },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { filetype, filename },
    lualine_x = { "location" },
    lualine_y = {},
    lualine_z = {},
  },
}
