return {
    {
        'mogelbrod/vim-jsonpath',
        keys = {
            { 
                "<leader>p",
                function() vim.cmd(":call jsonpath#echo()") end,
                ft = "json",
                desc = "Print current JSON [P]ath",
            },
        },
    },
}
