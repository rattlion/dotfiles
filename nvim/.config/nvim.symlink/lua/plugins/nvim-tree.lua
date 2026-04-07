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

        local in_cwd = vim.startswith(buffer_directory, cwd)
        local root = in_cwd and cwd or buffer_directory

        if api.is_visible() then
          if in_cwd then
            api.close()
          else
            api.open({ path = root, find_file = true })
          end
        else
          api.open({ path = root, find_file = true })
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
