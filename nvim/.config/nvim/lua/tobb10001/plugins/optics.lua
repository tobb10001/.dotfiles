return {
    -- Colorscheme
    {
        'folke/tokyonight.nvim',
        lazy = false,
        priority = 1000,
        opts = {
            transparent = false,
            on_highlights = function(hl, c)
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
            progress = {
                display = {
                    progress_icon = { pattern = "moon" }
                },
            }
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
        main = 'ibl',
        opts = {
            -- indent = { char = "┊" },
        },
	version = "v3.5.0",
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
    {
        'mawkler/modicator.nvim',
        opts = {},
    },
    {
        'shortcuts/no-neck-pain.nvim',
        version = "*",
    },
}
