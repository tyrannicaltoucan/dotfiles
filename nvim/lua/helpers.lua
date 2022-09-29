local M = {}

function M.map(mode, keys, cmd, opts)
  opts = vim.tbl_extend("keep", opt or {}, { silent = true })
  vim.keymap.set(mode, keys, cmd, opts)
end

function M.trim_whitespace()
  local view = vim.fn.winsaveview()
  vim.cmd [[keeppatterns %s/\v\s+$//e]]
  vim.cmd [[keeppatterns %s/\v($\n\s*)+%$//e]]
  vim.cmd [[keeppatterns %s/\s\+$//e]]
  vim.fn.winrestview(view)
end

return M
