local telescope = require("telescope")

telescope.load_extension("fzy_native")
telescope.setup {
    defaults = {
        prompt_prefix = " ",
        selection_caret = "  ",
        path_display = { truncate = 1 },
        layout_config = {
            horizontal = {
                width = 0.85,
                height = 0.90,
                preview_width = 0.60,
            },
        },
    },
    extensions = {
        fzy_native = {
            override_generic_sorter = true,
            override_file_sorter = true,
        },
    },
}
