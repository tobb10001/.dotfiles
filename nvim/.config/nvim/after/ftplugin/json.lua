vim.keymap.set("n",
    "<leader>p",
    function() vim.cmd(":call jsonpath#echo()") end,
    { desc = "Print current JSON [P]ath" }
)
