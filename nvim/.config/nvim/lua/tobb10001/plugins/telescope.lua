local function config()
    pcall(require('telescope').load_extension, 'fzf')
end

local keys = {
    {
        'so',
        function()
            return require('telescope.builtin').oldfiles()
        end,
        mode = 'n',
        desc = '[S]earch [o]ld files',
    },
    {
        'sb',
        function()
            return require('telescope.builtin').buffers()
        end,
        mode = 'n',
        desc = '[S]earch [B]uffers',
    },
    {
        '<leader>/',
        function()
            return require('telescope.builtin').current_buffer_fuzzy_find()
        end,
        mode = 'n',
        desc = 'Fuzzily find in current buffer.',
    },
    {
        'sd',
        function()
            return require('telescope.builtin').diagnostics()
        end,
        mode = 'n',
        desc = '[S]earch [D]iagnostics',
    },
    {
        'sa',
        function()
            return require('telescope.builtin').find_files({ hidden = true })
        end,
        mode = 'n',
        desc = '[S]earch [A]ll files',
    },
    {
        'sf',
        function()
            return require('telescope.builtin').git_files({ hidden = True })
        end,
        mode = 'n',
        desc = '[S]earch [F]iles',
    },
    {
        'sg',
        function()
            return require('telescope.builtin').live_grep({ additional_args = { "-." } })
        end,
        mode = 'n',
        desc = '[S]earch by [G]rep',
    },
    {
        'sh',
        function()
            return require('telescope.builtin').help_tags()
        end,
        mode = 'n',
        desc = '[S]earch [H]help tags',
    },
}

return {
    'nvim-telescope/telescope.nvim',
    opts = {
        defaults = {
            mappings = {},
        },
    },
    config = config,
    keys = keys,
    dependencies = {
        'nvim-lua/plenary.nvim',
        {
            'nvim-telescope/telescope-fzf-native.nvim',
            build = 'make'
        }
    },
}
