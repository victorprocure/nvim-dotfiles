--- Terminal: `CTRL+t` opens and closes one terminal at the bottom ---
--- The shell keeps running while hidden, so long commands survive toggle
local term_buf

local function toggle_terminal()
  local win = term_buf and vim.api.nvim_buf_is_valid(term_buf) and vim.fn.bufwinid(term_buf) or -1
  if win ~= -1 then
    vim.api.nvim_win_hide(win)
    return
  end
  vim.cmd('botright 15split')
  if term_buf and vim.api.nvim_buf_is_valid(term_buf) then
    vim.api.nvim_win_set_buf(0, term_buf)
  else
    vim.cmd.terminal()
    term_buf = vim.api.nvim_get_current_buf()
    vim.bo[term_buf].buflisted = false -- Keep it out of the buffer tabs
  end
  vim.cmd.startinsert()
end

vim.keymap.set({ 'n', 't' }, '<C-t>', toggle_terminal, { desc = 'Toggle terminal' })
