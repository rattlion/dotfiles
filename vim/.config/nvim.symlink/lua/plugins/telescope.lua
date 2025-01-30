local builtin = require('telescope.builtin')

return {
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make'
  },
  {
    'nvim-telescope/telescope-ui-select.nvim',
  },
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {
      defaults = {
        layout_strategy = 'vertical',
      },
    },
    keys = {
      { '<leader>ff', builtin.find_files, desc = 'Telescope find files' },
      { '<leader>fg', builtin.live_grep,  desc = 'Telescope live grep' },
      { '<leader>fb', builtin.buffers,    desc = 'Telescope search buffers' },
      { '<leader>fh', builtin.help_tags,  desc = 'Telescope search help' },
    },
    config = function()
      require('telescope').setup({
        extensions = {
          ['ui-select'] = {
            require("telescope.themes").get_dropdown()
          }
        }
      })
      require('telescope').load_extension('fzf')
      require('telescope').load_extension('ui-select')
    end
  }
}
