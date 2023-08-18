return {
    -- Colorscheme
    {
        'folke/tokyonight.nvim',
        lazy = false,
        priority = 1000,
        opts = {
            transparent = false,
            on_highlights = function (hl, c)
                hl.LineNr = {
                    fg = "#ffffff",
                }
                hl.LineNrAbove = {
                    fg = "#cccccc"
                }
                hl.LineNrBelow = {
                    fg = "#cccccc"
                }
                hl.Comment = {
                    fg = "#aaaaaa"
                }
                hl.DiagnosticUnnecessary = {
                    fg = "#777777"
                }
            end
        },
        init = function()
            vim.cmd(':colorscheme tokyonight')
        end,
    },
    -- Fidget for LSP Progress
    {
        'j-hui/fidget.nvim',
        opts = {
            text = {
                spinner = "moon", -- animation shown when tasks are ongoing
            },
            fmt = {
                leftpad = false, -- right-justify text in fidget box
            },
        },
    },
    -- Gitsigns
    {
        'lewis6991/gitsigns.nvim',
        config = true,
    },
    -- Transparent
    {
        'xiyaowong/transparent.nvim',
        lazy = false,
    },
    {
        'lukas-reineke/indent-blankline.nvim',
        opts = {
            char = '┊',
            show_trailing_blankline_indent = false,
        },
    },
    -- Lualine
    {
        'nvim-lualine/lualine.nvim',
        opts = {
            options = {
                icons_enabled = true,
                theme = 'tokyonight',
                component_separators = '|',
                section_separators = '',
            },
            sections = {
                lualine_c = { { 'filename', path = 1 } },
            }
        },
    },
    -- Tabline
    {
        'akinsho/bufferline.nvim',
        version = "*",
        dependencies = 'nvim-tree/nvim-web-devicons',
        config = true,
    },
}
