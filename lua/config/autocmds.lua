--- Flash what was just yanked ---
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.hl.on_yank()
  end,
})

--- Reload files changed on disk (by Claude, Git, etc.) when nvim regains focus
--- Buffers with unsaved edits are not overwritten; nvim asks instead
vim.api.nvim_create_autocmd({ 'FocusGained', 'BufEnter', 'TermLeave' }, {
  callback = function()
    if vim.fn.mode() ~= 'c' and vim.fn.getcmdwintype() == '' then
      vim.cmd.checktime()
    end
  end,
})
