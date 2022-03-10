require("telescope").load_extension("fzy_native")
require("telescope").setup {
    defaults = {
        prompt_prefix = " ",
        selection_caret = "  ",
        layout_strategy = "vertical",
        sorting_strategy = "ascending",
        path_display = { truncate = 1 },
        layout_config = {
            prompt_position = "top",
            preview_cutoff = 120,
            horizontal = {
                width = 0.87,
                height = 0.80,
                preview_width = 0.55,
                results_width = 0.8,
            },
            vertical = {
                width = 0.55,
                height = 0.80,
                mirror = false,
            },
        },
    },
    pickers = {
        live_grep = { layout_strategy = "horizontal" },
        help_tags = { layout_strategy = "horizontal" },
    },
    extensions = {
        fzy_native = {
            override_generic_sorter = true,
            override_file_sorter = true,
        },
    },
}
