return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    delay = function(ctx)
      return ctx.plugin and 0 or 800
    end,
  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
}
