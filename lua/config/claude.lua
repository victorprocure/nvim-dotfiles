--- Claude ---
require('claudecode').setup({
  ---@diagnostic disable-next-line: missing-fields
  terminal = {
    provider = 'native', --- use nvims built-in terminal
    split_side = 'right',
    split_width_percentage = 0.35,
  }
})
vim.keymap.set('n', '<leader>ac', '<cmd>ClaudeCode<cr>', { desc = 'Toggle Claude' })
vim.keymap.set('n', '<leader>af', '<cmd>ClaudeCodeFocus<cr>', { desc = 'Focus Claude' })
vim.keymap.set('n', '<leader>ar', '<cmd>ClaudeCode --resume<cr>', { desc = 'Resume a Claude session' })
vim.keymap.set('n', '<leader>ab', '<cmd>ClaudeCodeAdd %<cr>', { desc = 'Add this file to Claude' })
vim.keymap.set('x', '<leader>as', '<cmd>ClaudeCodeSend<cr>', { desc = 'Send selection to Claude' })
vim.keymap.set('n', '<leader>aa', '<cmd>ClaudeCodeDiffAccept<cr>', { desc = 'Accept Claude diff' })
vim.keymap.set('n', '<leader>ad', '<cmd>ClaudeCodeDiffDeny<cr>', { desc = 'Deny Claude diff' })

--- In the file explorer, '<leader>as' adds the file under the cursor to Claude
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'NvimTree',
  callback = function(ev)
    vim.keymap.set('n', '<leader>as', '<cmd>ClaudeCodeTreeAdd<cr>', { buffer = ev.buf, desc = 'Add file to Claude' })
  end
})

--- `CTRL+h` from the Claude panel jumps bac to the code on its left
--- terminal windows swallow normal keys, so this leaves the terminal mode first
vim.keymap.set('t', '<C-h>', '<C-\\><C-n><C-w>h', { desc = 'Leave the terminal to the left window' })
