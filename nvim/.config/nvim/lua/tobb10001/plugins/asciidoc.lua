return {
	"tigion/nvim-asciidoc-preview",
	ft = { "asciidoc" },
	build = "cd server && npm install",
	opts = {
		server = {
			converter = "js",
		},
		preview = {
			position = "sync",
		}
	}
}
