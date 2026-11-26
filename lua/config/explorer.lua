--- File Explorer ---
require('nvim-web-devicons').setup()
require('nvim-tree').setup({
  view = { side = 'left', width = 35 },
  update_focused_file = { enable = true },
  diagnostics = { enable = true },
  filters = { git_ignored = true, dotfiles = false },
})
vim.keymap.set('n', '<leader>e', '<cmd>NvimTreeToggle<cr>', { desc = 'Toggle file explorer' })


