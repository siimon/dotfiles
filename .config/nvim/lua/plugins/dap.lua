return {
	"rcarriga/nvim-dap-ui",
	dependencies = {
		"mfussenegger/nvim-dap",
		"nvim-neotest/nvim-nio",
		"theHamsta/nvim-dap-virtual-text",
	},
	config = function()
		local xcodebuild = require("xcodebuild.integrations.dap")
    local codelldbPath = os.getenv("HOME") .. "/tools/codelldb/extension/adapter/codelldb"

    xcodebuild.setup(codelldbPath)
	  local dap = require("dap")
		local dapui = require("dapui")
		dapui.setup({
			controls = {
        element = "repl",
        enabled = true,
        icons = {
          disconnect = "",
          run_last = "",
          terminate = "⏹︎",
          pause = "⏸︎",
          play = "",
          step_into = "󰆹",
          step_out = "󰆸",
          step_over = "",
          step_back = "",
        },
      },
      floating = {
        border = "single",
        mappings = {
          close = { "q", "<Esc>" },
        },
      },
			layouts = {
				{
					elements = {
						{ id = "stacks", size = 0.40 },
						{ id = "scopes", size = 0.40 },
						{ id = "breakpoints", size = 0.20 },
						-- { id = "watches", size = 0.25 },
					},
					position = "left",
					size = 40,
				},
				{
					elements = {
						{ id = "repl", size = 0.4 },
						{ id = "console", size = 0.6 },
					},
					position = "bottom",
          size = 30,
				}
			},
		})

		require("nvim-dap-virtual-text").setup()


    vim.keymap.set("n", "<leader>dd", xcodebuild.build_and_debug, { desc = "Build & Debug" })
		vim.keymap.set("n", "<leader>dr", xcodebuild.debug_without_build, { desc = "Debug Without Building" })
		vim.keymap.set("n", "<leader>dx", function()
      xcodebuild.terminate_session()
    end, { desc = "Terminate debugger" })
	  vim.keymap.set("n", "<space>b", xcodebuild.toggle_breakpoint, { desc = "Toggle Breakpoint" })
		vim.keymap.set("n", "<space>?", function()
        require("dapui").eval(nil, { enter = true })
      end)
		vim.keymap.set("n", "<space>c", function()
				require("dap").continue()
		end)
		vim.keymap.set("n", "<space>x", function()
			xcodebuild.clear_console()
		end)

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
		-- dap.listeners.after.event_initialized["dapui_config"] = function()
      -- dapui.open()
    -- end
    -- dap.listeners.before.event_terminated["dapui_config"] = function()
      -- dapui.close()
    -- end
    -- dap.listeners.before.event_exited["dapui_config"] = function()
      -- dapui.close()
    -- end
	end,
}
