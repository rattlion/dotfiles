vim.diagnostic.config({
  virtual_text = true,      -- Show virtual text diagnostics
  signs = true,             -- Show signs in the sign column
  update_in_insert = false, -- Don't update diagnostics in insert mode
  float = {                 -- Configuration for floating windows
    focusable = false,
    style = "minimal",
    border = "rounded",
    source = "always",
    header = "",
    prefix = "",
  },
})
