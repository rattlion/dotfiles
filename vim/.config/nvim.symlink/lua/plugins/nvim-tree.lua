return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    actions = {
      open_file = {
        quit_on_open = true
      }
    }
  },
  keys = {
    {
      "<leader>t",
      function()
        local api = require("nvim-tree.api")
        api.tree.toggle({ find_file = true })
      end,
      desc = "Nvim Tree toggle",
    },
  },
  init = function()
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
    vim.cmd("autocmd VimEnter * hi NvimTreeNormal guibg=NONE")
    vim.cmd("autocmd VimEnter * hi NvimTreeNormalNC guibg=NONE")
  end,
}
