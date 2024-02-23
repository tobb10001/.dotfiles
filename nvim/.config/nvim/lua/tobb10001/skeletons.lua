local skeletons = {
	["shell.nix"] = { "shell.nix" },
	["pyproject.toml"] = { "pyproject.toml" },
	[".pre-commit-config.yaml"] = { ".pre-commit-config.yaml" },
	["Taskfile.yml"] = { "Taskfile.yml", "Taskfile.yaml" },
}

local group = vim.api.nvim_create_augroup("tobb10001.skeletons", { clear = true })

for file, patterns in pairs(skeletons) do
	vim.api.nvim_create_autocmd("BufNewFile", {
		group = group,
		pattern = patterns,
		command = "0r ~/.config/nvim/skeletons/" .. file,
	})
end
