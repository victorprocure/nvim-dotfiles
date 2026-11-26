--- Git ---
require('diffview').setup()
require('gitsigns').setup({
  current_line_blame = true, --- Author, date, commit message after current line
  current_line_blame_opts = { delay = 500 }, --- ms; the cursor must rest before it appears
  --- runs for each buffer this is in a git repo; keymaps exist only in buffer
  on_attach = function(buf)
    local gs = require('gitsigns')
    local function map(mode, lhs, rhs, desc)
      vim.keymap.set(mode, lhs, rhs, { buffer = buf, desc = desc })
    end

    map('n', ']h', function()
      gs.nav_hunk('next')
    end, 'Next Change')
    map('n', '[h', function()
      gs.nav_hunk('prev')
    end, 'Previous Change')
    map('n', '<leader>hp', gs.preview_hunk_inline, 'Preview Change')
    map('n', '<leader>hs', gs.stage_hunk, 'Stage Change')
    map('n', '<leader>hr', gs.reset_hunk, 'Undo Change')
    map('x', '<leader>hs', function()
      gs.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') })
    end, 'Stage selected line')
    map('x', '<leader>hr', function()
      gs.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
    end, 'Undo selected line')
    map('n', '<leader>hb', function()
      gs.blame_line({ full = true })
    end, 'Full blame for this line')
    map('n', '<leader>tb', gs.toggle_current_line_blame, 'Toggle inline blame')
  end,
})

--- Fugitive needs no setup ---
vim.keymap.set('n', '<leader>gs', '<cmd>Git<cr>', { desc = 'Git status' })

--- Diffview ---
vim.keymap.set('n', '<leader>gd', '<cmd>DiffviewOpen<cr>', { desc = 'Diff working tree' })
vim.keymap.set(
  'n',
  '<leader>gm',
  '<cmd>DiffviewOpen origin/main...HEAD<cr>',
  { desc = 'Diff branch against main' }
)
vim.keymap.set(
  'n',
  '<leader>gh',
  '<cmd>DiffviewFileHistory %<cr>',
  { desc = 'History of this file' }
)
vim.keymap.set('n', '<leader>gq', '<cmd>DiffviewClose<cr>', { desc = 'Close diff view' })

--- GitLab links for the current line or selection ---
require('gitlinker').setup()
vim.keymap.set({ 'n', 'x' }, '<leader>gy', '<cmd>GitLink<cr>', { desc = 'Copy GitLab link' })
vim.keymap.set({ 'n', 'x' }, '<leader>gY', '<cmd>GitLink!<cr>', { desc = 'Open in GitLab' })
