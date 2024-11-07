return {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      "github/copilot.vim",
      "nvim-lua/plenary.nvim",
    },
    branch = "canary",
    lazy = true,
    cmd = {
      "CopilotChat",
      "CopilotChatReset",
      "CopilotChatDoc",
    },
    keys = {
      { "<leader>cc", "<cmd>CopilotChat<cr>", desc = "Copilot Chat" },
      { "<leader>cr", "<cmd>CopilotChatReset<cr>", desc = "Reset Copilot Chat" },
      { "<leader>cd", "<cmd>CopilotChatDoc<cr>", desc = "Copilot Chat Documentation" },
    },
    opts = {
      debug = false,
      model = "claude-3.5-sonnet",
    },
}
