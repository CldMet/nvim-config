return {
	{
		"mason-org/mason.nvim",
		config = function()
			require("mason").setup()
		end
	},
	{
		"mason-org/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls" }
			})
		end
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			vim.lsp.config()
			-- broken needs new config maybe a list of servers
			-- Henry Misc youtube "Neovim 0.11 upgrade - fixing my broken config."
		end
	}
}
