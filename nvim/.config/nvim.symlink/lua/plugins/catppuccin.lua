return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  opts = {
    flavour = "mocha", -- latte, frappe, macchiato, mocha
    color_overrides = {
      all = {
        base = "#000000",
      },
    },
    custom_highlights = {},
    default_integrations = true,
    -- For more plugins integrations please scroll down
    -- (https://github.com/catppuccin/nvim#integrations)
  },
  init = function()
    vim.cmd.colorscheme("catppuccin")
  end,
}
