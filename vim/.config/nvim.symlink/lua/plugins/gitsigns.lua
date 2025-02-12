return {
  "lewis6991/gitsigns.nvim",
  config = function()
    local gs = require('gitsigns')
    vim.keymap.set('n', '<leader>gb', gs.blame, { desc = 'Git blame' })
    gs.setup()
  end
}
