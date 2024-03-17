return {
    "pwntester/octo.nvim",
    dependencies = {
        { "nvim-tree/nvim-web-devicons", lazy = true },
        { "nvim-lua/plenary.nvim", lazy = true },
        { 'nvim-telescope/telescope.nvim', lazy = true },
    },
    keys = {
        { "<leader>ghl", "<cmd>Octo pr list<cr>", desc = "List pull requests" },
        { "<leader>ghr", "<cmd>Octo review start<cr>", desc = "Start review" },
        { "<leader>ghs", "<cmd>Octo review submit<cr>", desc = "Submit review" },
        { "<leader>ghc", "<cmd>Octo review commit<cr>", desc = "Review commits" },
        { "<leader>ghn", "<cmd>Octo pr create draft<cr>", desc = "Create draft pull request" },
        { "<leader>ghx", "<cmd>Octo thread resolve<cr>", desc = "Resolve thread" },
        { "<leader>ghO", "<cmd>Octo<cr>", desc = "Open interactive Octo telescope prompt" },
    },
    cmd = "Octo",
    config = function()
        require("octo").setup({
          enable_builtin = true
        })

        vim.treesitter.language.register('markdown', 'octo')
    end,
}
