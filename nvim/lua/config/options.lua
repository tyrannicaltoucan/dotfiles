local options = {
  backup = false,
  clipboard = "unnamedplus",
  completeopt = { "menuone", "noselect" },
  colorcolumn = { 101 },
  cursorline = true,
  mouse = "a",
  expandtab = true,
  list = true,
  listchars = { trail = "·", tab = "→ " },
  number = true,
  pumheight = 10,
  showmode = false,
  scrolloff = 5,
  shiftround = true,
  shiftwidth = 4,
  sidescrolloff = 5,
  signcolumn = "yes",
  softtabstop = 4,
  smartcase = true,
  splitbelow = true,
  splitright = true,
  swapfile = false,
  tabstop = 4,
  termguicolors = true,
  timeoutlen = 500,
  undofile = true,
  wrap = false,
  writebackup = false,
}

for key, val in pairs(options) do
  vim.opt[key] = val
end
