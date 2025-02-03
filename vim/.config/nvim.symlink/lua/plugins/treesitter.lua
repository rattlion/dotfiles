return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "javascript",
      "jsdoc",
      "json",
      "lua",
      "luadoc",
      "make",
      "markdown",
      "markdown_inline",
      "rust",
      "typescript",
    },
    auto_install = true,
    sync_install = true,
    highlight = { enable = true },
    indent = { enable = true },
  },
  build = function()
    require("nvim-treesitter.install").update({ with_sync = true })()
  end,
}
