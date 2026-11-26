--- Keymaps ---
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<cr>') -- `ESC` clears search highlights
vim.keymap.set('n', '<C-h>', '<C-w>h')              -- `CTRL+h/j/k/l` move between splits
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')
vim.keymap.set('x', 'J', ":m '>+1<cr>gv=gv", { silent = true, desc = 'Move selection down' })
vim.keymap.set('x', 'K', ":m '<-2<cr>gv=gv", { silent = true, desc = 'Move selection up' })
