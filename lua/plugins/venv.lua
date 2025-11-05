return {
	"linux-cultist/venv-selector.nvim",
	dependencies = {
		"neovim/nvim-lspconfig",
		{
			"nvim-telescope/telescope.nvim",
			branch = "latest",
			dependencies = { "nvim-lua/plenary.nvim" },
		},
	},
	ft = "python",
	keys = {
		{ ",v", "<cmd>VenvSelect<cr>" },
	},
	opts = {},
}
