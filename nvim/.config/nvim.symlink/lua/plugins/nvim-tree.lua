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
    },
    filters = {
      git_ignored = false
    }
  },
  keys = {
    {
      "<leader>t",
      function()
        local buffer_directory = vim.fn.expand('%:p:h')
        local cwd = vim.fn.getcwd()
        local api = require('nvim-tree.api').tree

        if not vim.startswith(buffer_directory, cwd) then
          api.change_root(buffer_directory)
          api.open({ find_file = true })
        else
          api.toggle({ find_file = true })
        end
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
