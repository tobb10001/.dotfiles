return {
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        init = function()
            require("nvim-treesitter.configs").setup({
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },
                indent = { enable = true },
                ensure_installed = {
                    "bash",
                    "dockerfile",
                    "fish",
                    "go",
                    "html",
                    "http",
                    "javascript",
                    "jsdoc",
                    "json",
                    "lua",
                    "markdown",
                    "markdown_inline",
                    "python",
                    "query",
                    "typescript",
                    "yaml",
                },
                sync_install = false,
                auto_install = true,
                incremental_selection = {
                    enable = true,
                    keymaps = {
                        init_selection = "vin",
                        node_incremental = "ni",
                        scope_incremental = false, -- I don't understand scope.
                        node_decremental = "nd",
                    },
                }
            })
        end,
        tag = "*",
    },
    {
        'nvim-treesitter/playground',
        build = ':TSInstall query',
    },
    {
        'nvim-treesitter/nvim-treesitter-textobjects',
        dependencies = { 'nvim-treesitter/nvim-treesitter' },
        init = function()
            require('nvim-treesitter.configs').setup({
                textobjects = {
                    select = {
                        enable = true,
                        lookahead = true,
                        keymaps = {
                            ["aa"] = "@parameter.outer", -- ???
                            ["ia"] = "@parameter.inner",
                            ["ab"] = "@block.outer",
                            ["ib"] = "@block.inner",
                            ["ic"] = "@call.inner",
                            ["ac"] = "@call.outer",
                            ["ae"] = "@statement.outer", -- expression
                            ["af"] = "@function.outer",
                            ["if"] = "@function.inner",
                            ["ii"] = "@conditional.inner", -- if
                            ["ai"] = "@conditional.outer",
                            ["il"] = "@loop.inner",
                            ["al"] = "@loop.outer",
                            ["as"] = "@class.outer",   -- struct
                            ["is"] = "@class.inner",
                            ["it"] = "@comment.inner", -- text
                            ["at"] = "@comment.outer",
                        }
                    },
                    swap = { enable = false }, -- for now
                    move = {
                        enable = true,
                        set_jumps = false,
                        goto_next_start = {
                            ["]f"] = "@function.outer",
                            ["]s"] = "@class.outer", -- struct
                        },
                        goto_next_end = {
                            ["]F"] = "@function.outer",
                            ["]S"] = "@class.outer", -- struct
                        },
                        goto_previous_start = {
                            ["[f"] = "@function.outer",
                            ["[s"] = "@class.outer", -- struct
                        },
                        goto_previous_end = {
                            ["[F"] = "@function.outer",
                            ["[S"] = "@class.outer", -- struct
                        },
                    },
                    lsp_interop = {
                        enable = true,
                        border = 'rounded',
                        peek_definition_code = {
                            ["<leader>pf"] = "@function.outer",
                            ["<leader>ps"] = "@class.outer",
                        },
                    }
                }
            })
        end
    },
    {
        'nvim-treesitter/nvim-treesitter-context',
        init = function()
            vim.keymap.set("n", "gC", function()
                require('treesitter-context').go_to_context(vim.v.count1)
            end, { silent = true, desc = "[G]oto [C]ontext" })
        end
    },
    'IndianBoy42/tree-sitter-just',
}
