---@diagnostic disable: undefined-field
return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",
		"mfussenegger/nvim-dap-python",
	},
	config = function()
		local dap = require("dap")
		local utils = require("dap.utils")
		local dapui = require("dapui")
		local dap_python = require("dap-python")
		local python = require("venv-selector").python

		local mason_debugpy = vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/bin/python"

		dap_python.resolve_python = function()
			local python_path = python
			if not python_path then
				return vim.fn.exepath("python3")
			end
			return python_path
		end

		dapui.setup()
		dap_python.setup()

		---@diagnostic disable-next-line: inject-field
		dap.adapters = {
			["pwa-node"] = {
				type = "server",
				port = "${port}",
				executable = {
					command = "js-debug-adapter",
					args = {
						"${port}",
					},
				},
			},
			["python"] = {
				type = "executable",
				command = mason_debugpy,
				args = { "-m", "debugpy.adapter" },
			},
		}

		for _, language in ipairs({ "typescript", "javascript" }) do
			dap.configurations[language] = {
				{
					type = "pwa-node",
					request = "launch",
					name = "Launch file",
					program = "${file}",
					cwd = "${workspaceFolder}",
				},
				{
					type = "pwa-node",
					request = "attach",
					name = "Attach to process ID",
					processId = utils.pick_process,
					cwd = "${workspaceFolder}",
				},
			}
		end

		dap.configurations.python = {
			{
				type = "python",
				request = "launch",
				name = "Launch file",
				program = "${file}",
				python_path = function()
					return dap_python.resolve_python()
				end,
			},
		}

		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end

		vim.keymap.set("n", "<Leader>dt", dap.toggle_breakpoint, {})
		vim.keymap.set("n", "<Leader>dc", dap.continue, {})
	end,
}
