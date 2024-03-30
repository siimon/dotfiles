return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  event = "VeryLazy",
  config = function()
    local function xcodebuild_device()
      if vim.g.xcodebuild_platform == "macOS" then
        return " macOS"
      end
      local function device_icon()
        if vim.g.xcodebuild_platform == "tvOS Simulator" or vim.g.xcodebuild_platform == "tvOS" then
          return ""
        end
        if vim.g.xcodebuild_platform == "iOS Simulator" or vim.g.xcodebuild_platform == "iOS" then
          return ""
        end
        return ""
      end

      local icon = device_icon()
      if vim.g.xcodebuild_os then
        return icon .. " " .. vim.g.xcodebuild_device_name .. " (" .. vim.g.xcodebuild_os .. ")"
      end

      return icon .. " " .. vim.g.xcodebuild_device_name
    end

    local function xcodebuild_last_status()
      local status = vim.g.xcodebuild_last_status
      if status ~= nil then
        return status
      end
      return ""
    end

    require('lualine').setup({
      options = {
        -- disabling section separators fixes
        -- the disappearing start screen issue
        section_separators =  "",
      },
      sections = {
        lualine_b = { "diff", "diagnostics" },
        lualine_x = {
          xcodebuild_last_status,
          xcodebuild_device,
        },
      },
    })
  end,
}
