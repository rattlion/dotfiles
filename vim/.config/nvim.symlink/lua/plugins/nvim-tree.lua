return { 
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {},
  keys = {
    { '<leader>n', vim.cmd.NvimTreeToggle, desc = 'Nvim Tree toggle' },
    { '<leader>m', vim.cmd.NvimTreeFindFile, desc = 'Nvim find file in tree' },
  },
  init = function()
    -- disable netrw at the very start of your init.lua
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
  end,
}
