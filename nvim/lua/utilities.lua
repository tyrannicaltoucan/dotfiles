local M = {}

local set_keymap_opts = function(opts)
    return vim.tbl_extend("keep", opts or {}, { silent = true, noremap = true })
end

M.map = function(mode, lhs, rhs, opts)
    vim.api.nvim_set_keymap(mode, lhs, rhs, set_keymap_opts(opts))
end

M.buf_map = function(buffer, mode, lhs, rhs, opts)
    vim.api.nvim_buf_set_keymap(buffer, mode, lhs, rhs, set_keymap_opts(opts))
end

M.buf_trim_whitespace = function()
    local view = vim.fn.winsaveview()
    vim.cmd [[keeppatterns %s/\v\s+$//e]]
    vim.cmd [[keeppatterns %s/\v($\n\s*)+%$//e]]
    vim.cmd [[keeppatterns %s/\s\+$//e]]
    vim.fn.winrestview(view)
end

return M
