--- Status line ---
vim.o.showmode = false -- lualine shows the mode, so hide nvims own
require('lualine').setup({
  options = { globalstatus = true }, -- one status line for the whole app
})
--- Buffer tabs ---
require('bufferline').setup({
  options = {
    diagnostics = 'nvim_lsp', -- error markers on tabs
    -- start the tabs to the right of file explorer
    offsets = { { filetype = 'NvimTree', text = 'Explorer', separator = true } },
  },
})
vim.keymap.set('n', '<S-h>', '<cmd>BufferLineCyclePrev<cr>', { desc = 'Previous tab' })
vim.keymap.set('n', '<S-l>', '<cmd>BufferLineCycleNext<cr>', { desc = 'Next tab' })
vim.keymap.set('n', '<leader>bd', '<cmd>bdelete<cr>', { desc = 'Close this buffer' })

--- Indent guides ---
require('ibl').setup() -- a line per indent level; the current block is highlighted by default

--- Key Hints ---
require('which-key').setup({
  preset = 'helix',
  spec = {
    { '<leader>a', group = 'claude' },
    { '<leader>b', group = 'buffer' },
    { '<leader>c', group = 'code' },
    { '<leader>f', group = 'find' },
    { '<leader>g', group = 'git' },
    { '<leader>h', group = 'change (hunk)' },
    { '<leader>q', group = 'session' },
    { '<leader>t', group = 'toggle' },
  },
})
