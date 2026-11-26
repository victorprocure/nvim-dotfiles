--- Formatting ---
local prettier = { 'prettier' } --- conform uses the packages own node_modules
require('conform').setup({
  formatters_by_ft = {
    javascript = prettier,
    javascriptreact = prettier,
    typescript = prettier,
    typescriptreact = prettier,
    json = prettier,
    jsonc = prettier,
    css = prettier,
    scss = prettier,
    graphql = prettier
  },
  format_on_save = function()
    if vim.g.disable_autoformat then
      return
    end
    --- lsp_format = 'never': only prettier formats, never a language server
    return { timeout_ms = 2000, lsp_format = 'never' }
  end,
})

vim.keymap.set({ 'n', 'x' }, '<leader>cf', function()
  require('conform').format({ async = true, lsp_format = 'never' })
end, { desc = 'Format file or selection' })

vim.keymap.set('n', '<leader>tf', function()
  vim.g.disable_autoformat = not vim.g.disable_autoformat
  vim.notify('Format on save: ' .. (vim.g.disable_autoformat and 'off' or 'on'))
end, { desc = 'Toggle format on save' })
