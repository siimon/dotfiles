return {
  "lewis6991/gitsigns.nvim",
  event = "VeryLazy",
  keys = {
    { "<leader>hs", "<cmd>lua require('gitsigns').stage_hunk()<cr>", desc = "Stage hunk" },
    { "<leader>hu", "<cmd>lua require('gitsigns').undo_stage_hunk()<cr>", desc = "Undo stage hunk" },
    { "<leader>hr", "<cmd>lua require('gitsigns').reset_hunk()<cr>", desc = "Reset hunk" },
    { "<leader>hp", "<cmd>lua require('gitsigns').preview_hunk()<cr>", desc = "Preview hunk" },
    { "<leader>hd", "<cmd>lua require('gitsigns').diffthis()<cr>", desc = "Diff this hunk" },
    {
      "[h", function()
        require("gitsigns").prev_hunk()
      end,
      { desc = "Previous hunk" }
    },
    {
      "]h", function()
        require("gitsigns").next_hunk()
      end,
      { desc = "Next hunk" }
    },
  },
  opts = { },
}
