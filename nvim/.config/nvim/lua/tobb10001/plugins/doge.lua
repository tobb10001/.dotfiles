return {
	'kkoomen/vim-doge',
	build = ':call doge#install()',
	init = function()
		vim.g.doge_enable_mappings = 0

		vim.keymap.set('n', '<leader>dg', '<Plug>(doge-generate)')
		vim.keymap.set('n', '<C-l>', '<Plug>(doge-comment-jump-forward)')
		vim.keymap.set('n', '<C-h>', '<Plug>(doge-comment-jump-backward)')
		vim.keymap.set('i', '<C-l>', '<Plug>(doge-comment-jump-forward)')
		vim.keymap.set('i', '<C-h>', '<Plug>(doge-comment-jump-backward)')
		vim.keymap.set('x', '<C-l>', '<Plug>(doge-comment-jump-forward)')
		vim.keymap.set('x', '<C-h>', '<Plug>(doge-comment-jump-backward)')
	end,
}
