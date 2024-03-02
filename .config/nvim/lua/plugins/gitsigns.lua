return {
  "lewis6991/gitsigns.nvim",
  keys = {
    { "<leader>hs", "<cmd>lua require('gitsigns').stage_hunk()<cr>", desc = "Stage hunk" },
    { "<leader>hu", "<cmd>lua require('gitsigns').undo_stage_hunk()<cr>", desc = "Undo stage hunk" },
    { "<leader>hr", "<cmd>lua require('gitsigns').reset_hunk()<cr>", desc = "Reset hunk" },
    { "<leader>hp", "<cmd>lua require('gitsigns').preview_hunk()<cr>", desc = "Preview hunk" },
    { "<leader>hd", "<cmd>lua require('gitsigns').diffthis()<cr>", desc = "Diff this hunk" },
    {
      "[c", function()
        if vim.wo.diff then return "[c" end
        require("gitsigns").prev_hunk()
      end,
      { desc = "Previous hunk" }
    },
    {
      "]c", function()
        if vim.wo.diff then return "]c" end
        require("gitsigns").next_hunk()
      end,
      { desc = "Next hunk" }
    },
  },
  config = function()
    require("gitsigns").setup()
  end
}
