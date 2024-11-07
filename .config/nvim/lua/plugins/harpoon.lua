return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim", 'nvim-telescope/telescope.nvim' },
    config = function()
        local harpoon = require("harpoon")

        -- REQUIRED
        harpoon:setup()
        -- -- REQUIRED

        vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end, { desc = "Add current file to Harpoon list" })
        vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Toggle Harpoon list" })

        vim.keymap.set("n", "<space>1", function() harpoon:list():select(1) end, { desc = "Harpoon select item 1" })
        vim.keymap.set("n", "<space>2", function() harpoon:list():select(2) end, { desc = "Harpoon select item 2" })
        vim.keymap.set("n", "<space>3", function() harpoon:list():select(3) end, { desc = "Harpoon select item 3" })
        vim.keymap.set("n", "<space>4", function() harpoon:list():select(4) end, { desc = "Harpoon select item 4" })
        vim.keymap.set("n", "<space>5", function() harpoon:list():select(5) end, { desc = "Harpoon select item 5" })
        vim.keymap.set("n", "<space>6", function() harpoon:list():select(6) end, { desc = "Harpoon select item 6" })
        vim.keymap.set("n", "<space>7", function() harpoon:list():select(7) end, { desc = "Harpoon select item 7" })

        -- Toggle previous & next buffers stored within Harpoon list
        vim.keymap.set("n", "[w", function() harpoon:list():prev() end, { desc = "Harpoon previous item" })
        vim.keymap.set("n", "]w", function() harpoon:list():next() end, { desc = "Harpoon next item" })
    end
}

