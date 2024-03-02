return {
  "folke/trouble.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("trouble").setup({
      auto_open = true,
      auto_close = false,
      auto_preview = true,
      auto_jump = {},
      cycle_results = false,
    })

    vim.keymap.set("n", "<leader>tt", function()
      require("trouble").toggle()
    end, { desc = "Toggle trouble" })

    vim.keymap.set("n", "[t", function()
      require("trouble").next({skip_groups = true, jump = true});
    end, { desc = "Next trouble" })

    vim.keymap.set("n", "]t", function()
      require("trouble").previous({skip_groups = true, jump = true});
    end, { desc = "Previous trouble" })

    vim.api.nvim_create_autocmd("User", {
      pattern = { "XcodebuildBuildFinished", "XcodebuildTestsFinished" },
      callback = function(event)
        if event.data.cancelled then
          return
        end

        if event.data.success then
          require("trouble").close()
        elseif not event.data.failedCount or event.data.failedCount > 0 then
          if next(vim.fn.getqflist()) then
            require("trouble").open({ focus = false, mode = "quickfix" })
          else
            require("trouble").close()
          end

          require("trouble").refresh()
        end
      end,
    })
  end
}
