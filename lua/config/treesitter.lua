--- Treesitter ---
--- Downloads and compiles any of these that are missing; then nothing
require('nvim-treesitter').install({
  'typescript', 'tsx', 'javascript', 'jsdoc', 'graphql', 'json', 'yaml', 'html', 'css', 'scss',
  'sql', 'bash', 'dockerfile', 'diff', 'gitcommit', 'git_rebase', 'lua', 'luadoc',
})

--- Turn on highlighting and indent for every file type that has a parser
vim.api.nvim_create_autocmd('FileType', {
  callback = function(ev)
    -- vim.treesitter.start errors when there is no parser; pcall turns that to false
    if not pcall(vim.treesitter.start, ev.buf) then
      return
    end
    --- Only take over indenting when this language has indent rules installed
    local lang = vim.treesitter.language.get_lang(ev.match)
    if lang and vim.treesitter.query.get(lang, 'indents') then
      vim.bo[ev.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end
  end,
})

--- Pin the enclosing function / class header to the top of the window while scrolling
require('treesitter-context').setup({ max_lines = 3 })

--- Text Objects ---
require('nvim-treesitter-textobjects').setup({
  select = { lookahead = true }, -- if the cursor isn't inside one, use the next one on the line
})

local select = require('nvim-treesitter-textobjects.select')
local move = require('nvim-treesitter-textobjects.move')

--- af / if function, ac / ic class, aa / ia argument, 'a' is the whole thing, 'i' is the inside.
local objects = { f = '@function', c = '@class', a = '@parameter' }
for key, name in pairs(objects) do
  vim.keymap.set({ 'x', 'o' }, 'a' .. key, function()
    select.select_textobject(name .. '.outer', 'textobjects')
  end, { desc = 'Around ' .. name })
  vim.keymap.set({ 'x', 'o' }, 'i' .. key, function()
    select.select_textobject(name .. '.inner', 'textobjects')
  end, { desc = 'Inside ' .. name })
end

vim.keymap.set({ 'n', 'x', 'o' }, ']f', function()
  move.goto_next_start('@function.outer', 'textobjects')
end, { desc = 'Next function' })
vim.keymap.set({ 'n', 'x', 'o' }, '[f', function()
  move.goto_previous_start('@function.outer', 'textobjects')
end, { desc = 'Previous function' })
