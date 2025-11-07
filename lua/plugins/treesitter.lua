return {
	"nvim-treesitter/nvim-treesitter",
	branch = "master",
	lazy = false,
	build = ":TSUpdate",
	main = "nvim-treesitter.configs",
	opts = {
		ensure_installed = {
			"c_sharp",
			"lua",
			"markdown",
			"markdown_inline",
			"python",
			"query",
			"razor",
			"vim",
			"vimdoc",
		},
		auto_install = true,
		highlight = { enable = true },
		indent = { enable = true },
	},
}
