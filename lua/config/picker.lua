--- Picker ---
local fzf = require('fzf-lua')
fzf.setup()

vim.keymap.set('n', '<leader>ff', fzf.files, { desc = 'Find files' })
vim.keymap.set('n', '<leader>fg', fzf.live_grep, { desc = 'Grep the project' })
vim.keymap.set('n', '<leader>fw', fzf.grep_cword, { desc = 'Grep word under cursor' })
vim.keymap.set('n', '<leader>fb', fzf.buffers, { desc = 'Open buffers' })
vim.keymap.set('n', '<leader>fr', fzf.oldfiles, { desc = 'Recent files' })
vim.keymap.set('n', '<leader>fh', fzf.helptags, { desc = 'Search help' })
vim.keymap.set('n', '<leader>f.', fzf.resume, { desc = 'Reopen last picker' })
vim.keymap.set('n', 'gd', fzf.lsp_definitions, { desc = 'Go to definition' })
vim.keymap.set('n', 'grr', fzf.lsp_references, { desc = 'References', nowait = true })
vim.keymap.set('n', '<leader>fc', fzf.colorschemes, { desc = 'Preview colour scheme' })
vim.keymap.set(
  'n',
  '<leader>fd',
  fzf.diagnostics_workspace,
  { desc = 'Diagnostics (all open files)' }
)
vim.keymap.set('n', '<leader>fD', fzf.diagnostics_document, { desc = 'Diagnostics (this file)' })
