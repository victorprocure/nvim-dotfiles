--- Editing helpers ---
require('nvim-autopairs').setup({ check_ts = true }) --- use treesitter
require('nvim-ts-autotag').setup() --- close and rename JSX/HTML

--- Surround: gsa add, gsd delete, gsr replace ---
require('mini.surround').setup({
  mappings = {
    add = 'gsa',
    delete = 'gsd',
    replace = 'gsr',
    find = 'gsf',
    find_left = 'gsF',
    highlight = 'gsh',
  },
})

--- Jump: s, then two characters, then the label shown on the match ---
require('flash').setup()
vim.keymap.set({ 'n', 'x', 'o' }, 's', function()
  require('flash').jump()
end, { desc = 'Jump on screen' })

--- Undo tree: browse and restore any earlier version of this file ---
vim.cmd.packadd('nvim.undotree')
vim.keymap.set('n', '<leader>u', '<cmd>Undotree<cr>', { desc = 'Undo tree' })
