local M = { "nvim-lualine/lualine.nvim" }

M.dependencies = {
  "nvim-tree/nvim-web-devicons",
}

M.config = function()
  local utils = require("utils")
  local c = require("onedark.colors")
  require("lualine.themes.onedark")
  local colors = {
    bg = c.bg0,
    fg = c.fg,
    red = c.red,
    green = c.green,
    yellow = c.yellow,
    blue = c.blue,
    purple = c.purple,
    cyan = c.cyan,
    gray = c.grey,
  }
  local one_dark = {
    inactive = {
      a = { fg = colors.green, bg = "#1d242f", gui = "bold" },
      b = { fg = colors.green, bg = "#1d242f" },
      c = { fg = colors.green, bg = "#1d242f" },
    },
    normal = {
      a = { fg = colors.green, bg = c.none, gui = "bold" },
      b = { fg = colors.fg, bg = c.none },
      c = { fg = colors.fg, bg = c.none },
    },
    visual = { a = { fg = colors.purple, bg = c.none, gui = "bold" } },
    replace = { a = { fg = colors.red, bg = c.none, gui = "bold" } },
    insert = { a = { fg = colors.blue, bg = c.none, gui = "bold" } },
    command = { a = { fg = colors.yellow, bg = c.none, gui = "bold" } },
    terminal = { a = { fg = colors.cyan, bg = c.none, gui = "bold" } },
  }
  require("lualine").setup({
    options = {
      icons_enabled = true,
      theme = one_dark,
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
      disabled_filetypes = {
        statusline = {},
        winbar = {},
      },
      ignore_focus = {},
      always_divide_middle = true,
      globalstatus = false,
      refresh = {
        statusline = 1000,
        tabline = 1000,
        winbar = 1000,
      },
    },
    sections = {
      lualine_a = {
        {
          "mode",
          fmt = function(str)
            return str:sub(1, 3)
          end,
        },
      },
      lualine_b = { { "branch", icon = "󰘬" }, "diff", "diagnostics" },
      lualine_c = {
        {
          "filename",
          component_separators = { left = "", right = "" },
          file_status = true,
          path = 1,
        },
        { "%=", component_separators = { left = "", right = "" } },
      },
      lualine_x = { "encoding", "fileformat", "filetype" },
      lualine_z = { "location" },
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = { "filename" },
      lualine_x = { "location" },
      lualine_y = {},
      lualine_z = {},
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {},
  })
end

return M
