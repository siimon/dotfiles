return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
        --require("which-key").setup()
        vim.o.timeout = true
        vim.o.timeoutlen = 1000
    end,
    opts = {
    },
}
