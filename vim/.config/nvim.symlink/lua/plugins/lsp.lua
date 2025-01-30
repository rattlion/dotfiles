return {
  {
    'williamboman/mason.nvim',
    config = true,
  },
  {
    'williamboman/mason-lspconfig.nvim',
    config = function()
      require('mason-lspconfig').setup({
        automatic_installation = true,
        ensure_installed = {
          'lua_ls',
        }
      })
    end
  },
  {
    'neovim/nvim-lspconfig',
    keys = {
      { 'K',    vim.lsp.buf.hover,           desc = 'Show hover info' },
      { 'gd',   vim.lsp.buf.definition,      desc = 'Go to definition' },
      { 'gi',   vim.lsp.buf.implementation,  desc = 'Go to implementation' },
      { 'go',   vim.lsp.buf.type_definition, desc = 'Go to type definition' },
      { 'gr',   vim.lsp.buf.references,      desc = 'Show references' },
      { 'gs',   vim.lsp.buf.signature_help,  desc = 'Show signature help' },
      { '<F3>', vim.lsp.buf.format,          desc = 'Format current file',  mode = { 'n', 'x' } },
      { '<F4>', vim.lsp.buf.code_action,     desc = 'Show code actions',    mode = { 'n', 'v' } },
    },
    config = function()
      local lspconfig = require('lspconfig')
      lspconfig.lua_ls.setup({
        -- find a way to move thee .luarc.json file, don't like it in the repo
      })
    end
  },
}
