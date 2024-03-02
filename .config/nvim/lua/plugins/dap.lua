return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "wojciech-kulik/xcodebuild.nvim",
  },
  lazy = true,
  ft = { "swift" },
  config = function()
    local dap = require("dap")
    local xcodebuild = require("xcodebuild.dap")

    dap.configurations.swift = {
      {
        name = "iOS App Debugger",
        type = "codelldb",
        request = "attach",
        program = xcodebuild.get_program_path,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
        waitFor = true
      },
    }

    dap.adapters.codelldb = {
      type = "server",
      port = "13000",
      executable = {
        command = os.getenv("HOME") .. "/code/codelldb-extension/adapter/codelldb",
        args = {
          "--port",
          "13000",
          "--liblldb",
          "/Applications/Xcode-15.2.0.app/Contents/SharedFrameworks/LLDB.framework/Versions/A/LLDB",
        }
      },
    }

    vim.keymap.set("n", "<leader>dd", xcodebuild.build_and_debug, { desc = "Build & Debug" })
    vim.keymap.set("n", "<leader>dr", xcodebuild.debug_without_build, { desc = "Debug Without Building" })
    vim.keymap.set("n", "<leader>dc", dap.continue)



  end
}
