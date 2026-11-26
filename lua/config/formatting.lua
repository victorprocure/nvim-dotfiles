--- Formatting ---
local formatters_by_ft = {}
for _, lang in pairs(require('config.languages')) do
  if lang.formatters then
    for _, ft in ipairs(lang.filetypes or {}) do
      formatters_by_ft[ft] = vim.tbl_keys(lang.formatters)
    end
  end
end
require('conform').setup({
  formatters_by_ft = formatters_by_ft,
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
