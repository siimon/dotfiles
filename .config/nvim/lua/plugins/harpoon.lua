return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim", 'nvim-telescope/telescope.nvim' },
    config = function()
        local harpoon = require("harpoon")

        -- REQUIRED
        harpoon:setup()
        -- -- REQUIRED

        vim.keymap.set("n", "<leader>a", function() harpoon:list():append() end, { desc = "Add current file to Harpoon list" })
        vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Toggle Harpoon list" })

        vim.keymap.set("n", "<leader><leader>q", function() harpoon:list():select(1) end, { desc = "Harpoon select item 1" })
        vim.keymap.set("n", "<leader><leader>w", function() harpoon:list():select(2) end, { desc = "Harpoon select item 2" })
        vim.keymap.set("n", "<leader><leader>e", function() harpoon:list():select(3) end, { desc = "Harpoon select item 3" })
        vim.keymap.set("n", "<leader><leader>r", function() harpoon:list():select(4) end, { desc = "Harpoon select item 4" })

        -- Toggle previous & next buffers stored within Harpoon list
        vim.keymap.set("n", "<leader>q", function() harpoon:list():prev() end, { desc = "Harpoon previous item" })
        vim.keymap.set("n", "<leader>w", function() harpoon:list():next() end, { desc = "Harpoon next item" })
    end
}

