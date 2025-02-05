local utils = {}

function utils:restore_cursor_setup()
  vim.api.nvim_create_autocmd("BufReadPost", {
    callback = function()
      local mark = vim.api.nvim_buf_get_mark(0, '"')
      local line_count = vim.api.nvim_buf_line_count(0)
      if mark[1] > 0 and mark[1] <= line_count then
        vim.api.nvim_win_set_cursor(0, mark)
        vim.cmd("normal! zz")
      end
    end,
  })
end

function utils:swap_windows(direction)
  local current_win = vim.api.nvim_get_current_win()
  local current_pos = vim.api.nvim_win_get_cursor(current_win)
  vim.cmd("wincmd " .. direction)
  local target_win = vim.api.nvim_get_current_win()

  if current_win ~= target_win then
    local target_pos = vim.api.nvim_win_get_cursor(target_win)
    local current_buf = vim.api.nvim_win_get_buf(current_win)
    local target_buf = vim.api.nvim_win_get_buf(target_win)

    -- Swap buffers
    vim.api.nvim_win_set_buf(current_win, target_buf)
    vim.api.nvim_win_set_buf(target_win, current_buf)

    -- Swap cursor positions
    vim.api.nvim_win_set_cursor(current_win, target_pos)
    vim.api.nvim_win_set_cursor(target_win, current_pos)

    vim.api.nvim_set_current_win(target_win)
  end
end

return utils
