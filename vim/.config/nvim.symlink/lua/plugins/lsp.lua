return {
  {
    "nvimtools/none-ls.nvim",
    dependencies = { "nvimtools/none-ls-extras.nvim" },
    config = function()
      local null_ls = require("null-ls")
      null_ls.setup({
        sources = {
          null_ls.builtins.completion.spell,
          null_ls.builtins.completion.luasnip,
          null_ls.builtins.diagnostics.checkmake,
          null_ls.builtins.diagnostics.dotenv_linter,
          null_ls.builtins.diagnostics.stylelint,
          require("none-ls.diagnostics.eslint"), -- requires none-ls-extras.nvim
        },
      })
    end
  },
  {
    'williamboman/mason.nvim',
    config = true,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        automatic_installation = true,
        ensure_installed = {
          "lua_ls",
          "eslint",
          "ts_ls",
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Show hover info" })
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
      vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "Go to implementation" })
      vim.keymap.set("n", "go", vim.lsp.buf.type_definition, { desc = "Go to type definition" })
      vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "Show references" })
      vim.keymap.set("n", "gs", vim.lsp.buf.signature_help, { desc = "Show signature help" })
      vim.keymap.set({ 'n', 'x' }, "<F3>", vim.lsp.buf.format, { desc = "Format current file" })
      vim.keymap.set({ "n", "v" }, "<F4>", vim.lsp.buf.code_action, { desc = "Show code actions" })

      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({
        -- find a way to move thee .luarc.json file, don't like it in the repo
      })
      lspconfig.eslint.setup({
      })
      lspconfig.ts_ls.setup({
      })
    end,
  },
}
