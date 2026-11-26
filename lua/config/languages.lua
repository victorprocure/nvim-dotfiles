--- Languages: the one place to add or remove supported languages ---
--- filetypes: which buffers the formatters apply to
--- parsers: treesitter grammars to install
--- servers: { lspconfig name = mason package }
--- formatters: { conform name = mason package }
return {
  typescript = {
    filetypes = { 'typescript', 'typescriptreact' },
    parsers = { 'typescript', 'tsx' },
    servers = { vtsls = 'vtsls', eslint = 'eslint-lsp' },
    formatters = { prettier = 'prettier' },
  },
  javascript = {
    filetypes = { 'javascript', 'javascriptreact' },
    parsers = { 'javascript', 'jsdoc' },
    servers = { vtsls = 'vtsls', eslint = 'eslint-lsp' },
    formatters = { prettier = 'prettier' },
  },
  json = {
    filetypes = { 'json', 'jsonc' },
    parsers = { 'json' },
    servers = { jsonls = 'json-lsp' },
    formatters = { prettier = 'prettier' }
  },
  css = {
    filetypes = { 'css', 'scss' },
    parsers = { 'css', 'scss' },
    servers = { tailwindcss = 'tailwindcss-language-server' },
    formatters = { prettier = 'prettier' },
  },
  graphql = {
    filetypes = { 'graphql' },
    parsers = { 'graphql' },
    servers = { graphql = 'graphql-language-service-cli' },
    formatters = { prettier = 'prettier' },
  },
  yaml = {
    parsers = { 'yaml' },
    servers = { yamlls = 'yaml-language-server' }
  },
  lua = {
    parsers = { 'lua', 'luadoc' },
    servers = { lua_ls = 'lua-language-server' },
  },
  html = {
    parsers = { 'html' }
  },
  other = {
    parsers = { 'sql', 'bash', 'dockerfile', 'diff', 'gitcommit', 'git_rebase' }
  },
}
