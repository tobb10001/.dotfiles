return {
    {
        'lewis6991/gitsigns.nvim',
        config = {
            on_attach = function(bufnr)
                local gs = package.loaded.gitsigns
                local map = function(mode, keys, func, desc)
                    if desc then
                        desc = 'Gitsigns: ' .. desc
                    end
                    vim.keymap.set(mode, keys, func, { buffer = bufnr, desc = desc })
                end
                map('n', '<leader>hs', gs.stage_hunk, "GitSigns: [S]tage [H]unk")
                map('n', '<leader>hr', gs.reset_hunk, "GitSigns: [S]tage [R]eset")
                map('v', '<leader>hs', function() gs.stage_hunk { vim.fn.line('.'), vim.fn.line('v') } end,
                    "GitSigns: [S]tage [H]unk")
                map('v', '<leader>hr', function() gs.reset_hunk { vim.fn.line('.'), vim.fn.line('v') } end,
                    "GitSigns: [S]tage [R]eset")
            end
        },
    },
    'tpope/vim-fugitive',
    {
        'linrongbin16/gitlinker.nvim',
        config = function()
            require('gitlinker').setup({
                router = {
                    -- false positives are never a problem here...
                    browse = {
                        ["^gitlab.*"] = require('gitlinker.routers').gitlab_browse
                    },
                    blame = {
                        ["^gitlab.*"] = require('gitlinker.routers').gitlab_blame
                    }
                }
            })
        end,
    },
    {
        'harrisoncramer/gitlab.nvim',
        dependencies = {
            "MunifTanjim/nui.nvim",
            "nvim-lua/plenary.nvim",
            "sindrets/diffview.nvim",
            "stevearc/dressing.nvim", -- Recommended but not required. Better UI for pickers.
            "nvim-tree/nvim-web-devicons" -- Recommended but not required. Icons in discussion tree.
        },
        build = function () require("gitlab.server").build(true) end,
        config = function() require("gitlab").setup() end,
    },
}
