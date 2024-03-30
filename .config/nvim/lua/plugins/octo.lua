return {
    "pwntester/octo.nvim",
    dependencies = {
        { "nvim-tree/nvim-web-devicons", lazy = true },
        { "nvim-lua/plenary.nvim", lazy = true },
        { 'nvim-telescope/telescope.nvim', lazy = true },
    },
    keys = {
        { "<leader>ghl", "<cmd>Octo pr list<cr>", desc = "List PRs" },
        { "<leader>ghr", "<cmd>Octo review start<cr>", desc = "Start Review" },
        { "<leader>ghs", "<cmd>Octo review submit<cr>", desc = "Submit Review" },
        { "<leader>ghc", "<cmd>Octo review commit<cr>", desc = "Review Commits" },
        { "<leader>ghn", "<cmd>Octo pr create draft<cr>", desc = "New Draft PR" },
        { "<leader>ghx", "<cmd>Octo thread resolve<cr>", desc = "Resolve Thread" },
        { "<leader>ghO", "<cmd>Octo<cr>", desc = "Open Interactive Octo" },
    },
    cmd = "Octo",
    config = function()
        require("octo").setup({
          enable_builtin = true
        })

        vim.treesitter.language.register('markdown', 'octo')
    end,
}
