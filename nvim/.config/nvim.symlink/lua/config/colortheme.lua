local function apply_theme()
  if vim.o.background == "dark" then
    vim.cmd.colorscheme("catppuccin")
    vim.api.nvim_set_hl(0, "Normal", { bg = "#000000" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#000000" })
  else
    vim.cmd.colorscheme("catppuccin")
  end
end

apply_theme()

vim.api.nvim_create_autocmd("OptionSet", {
  pattern = "background",
  callback = apply_theme,
})
