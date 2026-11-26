--- Sessions: saved automatically per folder on exit, restored when asked ---
require('persistence').setup()

vim.keymap.set('n', '<leader>qs', function()
  require('persistence').load()
end, { desc = 'Restore session for this folder' })
vim.keymap.set('n', '<leader>ql', function()
  require('persistence').load({ last = true })
end, { desc = 'Restore the last session anywhere' })
