return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    delay = function(ctx)
      return ctx.plugin and 0 or 800
    end,
    preset = 'modern',
  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show()
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
}
