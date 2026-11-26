--- Languages: the one place to add or remove supported languages ---
--- filetypes: which buffers the formatters apply to
--- parsers: treesitter grammars to install
--- servers: { lspconfig name = mason package, or false if it comes with language SDK }
--- formatters: { conform name = mason package, or false if it comes with language SDK }
return {
  dart = {
    filetypes = { 'dart' },
    parsers = { 'dart' },
    servers = { dartls = false },
    formatters = { dart_format = false },
  },
  html = {
    parsers = { 'html' },
  },
  lua = {
    filetypes = { 'lua' },
    parsers = { 'lua', 'luaadoc' },
    servers = { lua_ls = 'lua-language-server' },
    formatters = { stylua = 'stylua' },
  },
  java = {
    filetypes = { 'java' },
    parsers = { 'java' },
    servers = { jdtls = 'jdtls' },
    formatters = { ['google-java-format'] = 'google-java-format' },
  },
  kotlin = {
    filetypes = { 'kotlin' },
    parsers = { 'kotlin' },
    servers = { kotlin_lsp = 'kotlin-lsp' },
    formatters = { ktlint = 'ktlint' },
  },
  objc = {
    filetypes = { 'objc', 'objcpp' },
    parsers = { 'objc' },
    servers = { clangd = 'clangd' },
    formatters = { clang_format = 'clang-format' },
  },
  swift = {
    filetypes = { 'swift' },
    parsers = { 'swift' },
    servers = { sourcekit = false },
    formatters = { swiftformat = 'swiftformat' },
  },
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
    formatters = { prettier = 'prettier' },
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
    servers = { yamlls = 'yaml-language-server' },
  },

  other = {
    parsers = { 'sql', 'bash', 'dockerfile', 'diff', 'gitcommit', 'git_rebase' },
  },
}
