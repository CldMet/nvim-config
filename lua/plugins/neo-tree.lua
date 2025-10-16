return {
    	"nvim-neo-tree/neo-tree.nvim",
    	branch = "v3.x",
    	dependencies = {
      	"nvim-lua/plenary.nvim",
      	"MunifTanjim/nui.nvim",
      	"nvim-tree/nvim-web-devicons", -- optional, but recommended
    	},
    	lazy = false, -- neo-tree will lazily load itself
	---@module 'neo-tree'
	---@type neotree.Config
	keys = {
		{ '\\', ':Neotree filesystem reveal left<CR>', desc = 'NeoTree Reveal', silent = true },
		{'<leader>ngs', ':Neotree float git_status<CR>', noremap = true, silent = true }, -- open git status window
	},
	opts = {
		popup_border_style = 'rounded',
      		enable_git_status = true,
     		enable_diagnostics = true,
      		window = {
        		mappings = {
          			['\\'] = 'close_window',
        			},
      			},
		filesystem = {
			filtered_items = {
          			visible = false, -- when true, they will just be displayed differently than normal items
          			hide_dotfiles = false,
          			hide_gitignored = false,
          			hide_hidden = false, -- only works on Windows for hidden files/directories
          			hide_by_name = {
            				'.DS_Store',
            				'thumbs.db',
            				'node_modules',
            				'__pycache__',
            				'.virtual_documents',
            				'.git',
            				'.python-version',
            				'.venv',
          				},
				},
    			},
		git_status = {
        		window = {
          			position = 'float',
          			mappings = {
            				['A'] = 'git_add_all',
            				['gu'] = 'git_unstage_file',
            				['ga'] = 'git_add_file',
            				['gr'] = 'git_revert_file',
            				['gc'] = 'git_commit',
            				['gp'] = 'git_push',
            				['gg'] = 'git_commit_and_push',
            				['o'] = { 'show_help', nowait = false, config = { title = 'Order by', prefix_key = 'o' } },
            				['oc'] = { 'order_by_created', nowait = false },
            				['od'] = { 'order_by_diagnostics', nowait = false },
            				['om'] = { 'order_by_modified', nowait = false },
            				['on'] = { 'order_by_name', nowait = false },
            				['os'] = { 'order_by_size', nowait = false },
            				['ot'] = { 'order_by_type', nowait = false },
          			},
        		},
      		},
	},
}
