return {
	'neovim/nvim-lspconfig',
	dependencies = {
		{ 'mason-org/mason.nvim', config = true },
		'mason-org/mason-lspconfig.nvim',
		'WhoIsSethDaniel/mason-tool-installer.nvim',
	},
	config = function()
		local servers = {
			lua_ls = {
				settings = {
					Lua = {
						completion = {
							callSnippet = 'Replace',
						},
						runtime = { version = 'LuaJIT' },
						workspace = {
							checkThirdParty = false,
							library = vim.api.nvim_get_runtime_file('', true),
						},
						diagnostics = {
							globals = { 'vim' },
						},
						format = {
							enable = false,
						},
					},
				},
			},
		}
		local ensure_installed = vim.tbl_keys(servers or {})
		vim.list_extend(ensure_installed, {
			'stylua',
		})
		require('mason-tool-installer').setup { ensure_installed = ensure_installed }

		for server, cfg in pairs(servers) do
			vim.lsp.config(server, cfg)
			vim.lsp.enable(server)
		end
	end,
}
