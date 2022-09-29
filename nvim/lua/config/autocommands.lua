local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local ft_settings = augroup("FileTypeSettings", { clear = true })

autocmd({ "FileType" }, {
  pattern = "makefile",
  command = "setlocal noexpandtab",
  group = ft_settings,
})

autocmd({ "FileType" }, {
  pattern = { "yaml", "json", "lua" },
  command = "setlocal ts=2 sts=2 sw=2",
  group = ft_settings,
})

autocmd({ "FileType" }, {
  pattern = "gitcommit",
  command = "setlocal spell spelllang=en_us cc=51,72",
  group = ft_settings,
})

autocmd({ "FileType" }, {
  pattern = { "txt", "markdown" },
  command = "setlocal spell spelllang=en_us",
  group = ft_settings,
})

local ft_aliases = augroup("FileTypeAliases", { clear = true })

autocmd({ "BufNewFile", "BufRead" }, {
  pattern = { ".clang-format", ".clang-tidy" },
  command = "setfiletype yaml",
  group = ft_aliases,
})
