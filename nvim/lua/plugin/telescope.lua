local telescope = require("telescope")

telescope.setup {
  defaults = {
    prompt_prefix = "   ",
    selection_caret = "  ",
    entry_prefix = "  ",
    sorting_strategy = "ascending",
    layout_config = {
      horizontal = { prompt_position = "top" },
      vertical = { prompt_position = "top" },
    },
  },
  extensions = {
    file_browser = {
      hijack_newtrw = true,
      grouped = true,
    },
  },
}

telescope.load_extension("file_browser")
telescope.load_extension("fzf")

local map = require("helpers").map
map("n", "<leader>ft", ":Telescope file_browser<CR>")
map("n", "<leader>ff", ":Telescope find_files<CR>")
map("n", "<leader>fb", ":Telescope buffers<CR>")
map("n", "<leader>fh", ":Telescope help_tags<CR>")
