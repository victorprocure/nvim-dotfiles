--- Colour Scheme: start with last chosen ---
local theme_file = vim.fn.stdpath('state') .. '/colourscheme' -- ~/.local/state/colourscheme
local default_theme = 'kanagawa'

--- Whenever the scheme changes, write its name to the file
vim.api.nvim_create_autocmd('ColorScheme', {
  callback = function(ev)
    vim.fn.writefile({ ev.match }, theme_file) -- ev.match is the scheme's name
  end,
})

--- At startup, apply the saved scheme, falling back to default
local saved = vim.fn.filereadable(theme_file) == 1 and vim.fn.readfile(theme_file)[1]
  or default_theme
if not pcall(vim.cmd.colorscheme, saved) then
  --- The saved theme no longer exists
  vim.cmd.colorscheme(default_theme)
end
