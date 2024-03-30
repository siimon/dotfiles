return {
  "wojciech-kulik/xcodebuild.nvim",
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "j-hui/fidget.nvim",
    "MunifTanjim/nui.nvim",
  },
  dev = true,
  ft = { "swift" },
  keys = {
    { "<leader>X", "<cmd>XcodebuildPicker<cr>", desc = "Show Xcodebuild Actions" },
    { "<leader>xf", "<cmd>XcodebuildProjectManager<cr>", desc = "Show Project Manager Actions" },
    { "<leader>xb", "<cmd>XcodebuildBuild<cr>", desc = "Build Project" },
    { "<leader>xB", "<cmd>XcodebuildBuildForTesting<cr>", desc = "Build For Testing" },
    { "<leader>xr", "<cmd>XcodebuildBuildRun<cr>", desc = "Build & Run Project" },
    { "<leader>xR", "<cmd>XcodebuildRun<cr>", desc = "Run Project" },
    { "<leader>xC", "<cmd>XcodebuildCleanBuild<cr>", desc = "Clean & Build Project" },
    { "<leader>xt", "<cmd>XcodebuildTest<cr>", desc = "Run Tests" },
    { "<leader>xt", "<cmd>XcodebuildTestSelected<cr>", desc = "Run Selected Tests", mode = "v"},
    { "<leader>xT", "<cmd>XcodebuildTestClass<cr>", desc = "Run This Test Class" },
    { "<leader>xl", "<cmd>XcodebuildToggleLogs<cr>", desc = "Toggle Xcodebuild Logs" },
    { "<leader>xe", "<cmd>XcodebuildTestExplorerToggle<cr>", desc = "Toggle Test Explorer" },
    { "<leader>xs", "<cmd>XcodebuildFailingSnapshots<cr>", desc = "Show Failing Snapshots" },
    { "<leader>xd", "<cmd>XcodebuildSelectDevice<cr>", desc = "Select Device" },
    { "<leader>xp", "<cmd>XcodebuildSelectTestPlan<cr>", desc = "Select Test Plan" },
    { "<leader>xc", "<cmd>XcodebuildCancel<cr>", desc = "Cancel build" },
    { "<leader>xq", "<cmd>Telescope quickfix<cr>", desc = "Show QuickFix List" },
    { "<leader>xS", "<cmd>XcodebuildSelectScheme<cr>", desc = "Select Scheme" },
  },
  config = function()
    require("xcodebuild").setup({
      show_build_progress_bar = false,
      logs = {
        auto_open_on_failed_build = false,
        auto_open_on_failed_tests = false,
        auto_close_on_app_launch = true,
      },
      test_search = {
        target_matching = false
      },
      test_explorer = {
        auto_focus = false
      },
      commands = {
        extra_build_args = "-parallelizeTargets -skipPackageUpdates",
      },
    })
  end
}
