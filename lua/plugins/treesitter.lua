return {
	"nvim-treesitter/nvim-treesitter",
	branch = 'master',
	lazy = false,
	build = ":TSUpdate",
	main = "nvim-treesitter.configs",
	opts = {
		ensure_installed = {"lua", "markdown", "markdown_inline", "query", "vim", "vimdoc"},
		auto_install = true,
		highlight = { enable = true },
		indent = { enable = true },
	},
}
