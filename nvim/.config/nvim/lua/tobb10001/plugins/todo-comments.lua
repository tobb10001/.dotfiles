return {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = true,
    lazy = false,
    keys = {
        {
            ']t',
            function() require('todo-comments').jump_next() end,
            mode = 'n',
            desc = 'Jump to next TODO.',
        },
        {
            '[t',
            function() require('todo-comments').jump_prev() end,
            mode = 'n',
            desc = 'Jump to previous TODO.',
        },
    }
}
