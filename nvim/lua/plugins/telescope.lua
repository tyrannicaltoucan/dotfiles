local telescope = require("telescope")

telescope.load_extension("fzy_native")
telescope.setup {
    defaults = {
        prompt_prefix = "❯ ",
        selection_caret = "❯ ",
        sorting_strategy = "ascending",
        file_sorter = require("telescope.sorters").get_fzy_sorter,
        file_ignore_patterns = { ".git/", "build/", ".cache/", ".DS_Store" },
        layout_config = {
            prompt_position = "top",
            horizontal = {
                width = 0.80,
                width_padding = 0.1,
                height_padding = 0.1,
                preview_width = 0.60
            },
            vertical = {
                width = 0.70,
                width_padding = 0.05,
                height_padding = 1,
                preview_width = 0.50
            }
        }
    },
    pickers = {
        buffers = { theme = "dropdown", layout_config = { width = 0.50 }, previewer = false },
    },
    extensions = {
        fzy_native = {
            override_generic_sorter = true,
            override_file_sorter = true,
        }
    }
}

local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>fb", "<cmd>Telescope buffers<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", opts)
