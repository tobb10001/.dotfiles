local skeletons = {
	["shell.nix"] = "shell.nix",
	["pyproject.toml"] = "pyproject.toml",
	[".pre-commit-config.yaml"] = ".pre-commit-config.yaml",
}

local group = vim.api.nvim_create_augroup("tobb10001.skeletons", { clear = true })

for pattern, file in pairs(skeletons) do
	vim.api.nvim_create_autocmd("BufNewFile", {
		group = group,
		pattern = pattern,
		command = "0r ~/.config/nvim/skeletons/" .. file,
	})
end
