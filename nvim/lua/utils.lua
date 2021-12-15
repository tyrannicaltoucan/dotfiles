local M = {}
local api = vim.api
local cmd = vim.cmd
local fn = vim.fn

local append_keymap_opts = function(opts)
    return vim.tbl_extend('keep', opts or {}, { silent = true, noremap = true })
end

M.augroup = function(name, autocmds)
    cmd('augroup ' .. name)
    cmd('autocmd!')

    for _, autocmd in ipairs(autocmds) do
        cmd('autocmd ' .. table.concat(autocmd, ' '))
    end

    cmd('augroup END')
end

M.keymap = function(mode, lhs, rhs, opts)
    api.nvim_set_keymap(mode, lhs, rhs, append_keymap_opts(opts))
end

M.buf_keymap = function(buffer, mode, lhs, rhs, opts)
    api.nvim_buf_set_keymap(buffer, mode, lhs, rhs, append_keymap_opts(opts))
end

M.buf_trim_whitespace = function()
    local view = fn.winsaveview()
    cmd([[keeppatterns %s/\v\s+$//e]])
    cmd([[keeppatterns %s/\v($\n\s*)+%$//e]])
    cmd([[keeppatterns %s/\s\+$//e]])
    fn.winrestview(view)
end

return M
