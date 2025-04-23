local telescope = require('telescope').setup({
    defaults = {
        layout_strategy = 'horizontal',
        layout_config = {
            horizontal = {
                prompt_position = 'top',
                preview_width = 0.55,
                results_width = 0.8,
            },
        },
        sorting_strategy = 'ascending',
        selection_strategy = 'reset',
    },
    pickers = {
        find_files = {
            hidden = true, -- Show hidden files
        },
        git_files = {
            hidden = true, -- Show hidden files
        },
    }
})
