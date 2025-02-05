-- ALL THE HIGHLIGHT GROUPS

-- Highlight on Yank
local yank_autogroup = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank({
      higroup = "YankColor",
    })
  end,
  group = yank_autogroup,
  pattern = "*",
})

-- Floating window colors
vim.api.nvim_set_hl(0, "NormalFloat", { link = "Normal" })
vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })

-- Yank color
vim.api.nvim_set_hl(0, "YankColor", { bg = "#186C3F" })

-- Matching parenthesis highlight
vim.api.nvim_set_hl(0, "MatchParen", { bg = "#515a6b" })

-- Cursor Line
vim.api.nvim_set_hl(0, "CursorLine", { bg = "#262626" })

-- Set spelling check highlight group to purple
vim.api.nvim_set_hl(0, "SpellBad", { sp = "orange", nocombine = true, undercurl = true })
