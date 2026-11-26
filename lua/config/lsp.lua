--- Language Servers ---
require('mason').setup()   -- installer; also puts bin folder on nvim's PATH
local servers, packages = {}, {}
for _, lang in pairs(require('config.languages')) do
  for server, pkg in pairs(lang.servers or {}) do
    servers[server] = true
    packages[pkg] = true
  end
  for _, pkg in pairs(lang.formatters or {}) do
    packages[pkg] = true
  end
end

local registry = require('mason-registry')
registry.refresh(function()
  for name in pairs(packages) do
    local pkg = registry.get_package(name)
    if not pkg:is_installed() then
      pkg:install()
    end
  end
end)

require('lazydev').setup() -- teaches lua_ls about the nvim api

vim.lsp.config('vtsls', {
  settings = {
    vtsls = { autoUseWorkspaceTsdk = true },   -- Use the repos typescript version
    typescript = {
      tsserver = { maxTsServerMemory = 8192 }, -- MB; default runs oom on large projects
      inlayHints = {
        parameterNames = { enabled = 'all' },
        variableTypes = { enabled = true },
        functionLikeReturnTypes = { enabled = true },
      },
    },
  },
})

--- Inlay hints are off until toggled
vim.keymap.set('n', '<leader>th', function()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, { desc = 'Toggle inlay hints' })

--- Sort imports and remove unused ones in this file
vim.keymap.set('n', '<leader>co', function()
  vim.lsp.buf.code_action({ context = { only = { 'source.organizeImports' } }, apply = true })
end, { desc = 'Organize imports' })

--- Highlight other uses of the symbol under the cursor once it rests
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if not client or not client:supports_method('textDocument/documentHighlight', ev.buf) then
      return
    end
    --- one group per buffer, cleared each time, so severals don't stack duplicates
    local group = vim.api.nvim_create_augroup('symbol_highlight_' .. ev.buf, { clear = true })
    vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
      group = group,
      buffer = ev.buf,
      callback = vim.lsp.buf.document_highlight,
    })
    vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
      group = group,
      buffer = ev.buf,
      callback = vim.lsp.buf.clear_references,
    })
  end,
})

vim.lsp.enable(vim.tbl_keys(servers))
vim.diagnostic.config({ virtual_text = true, severity_sort = true })
