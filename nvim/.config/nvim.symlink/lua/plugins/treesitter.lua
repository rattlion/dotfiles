return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "bash",
      "css",
      "html",
      "javascript",
      "jsdoc",
      "json",
      "lua",
      "luadoc",
      "make",
      "markdown",
      "markdown_inline",
      "ruby",
      "rust",
      "scss",
      "typescript",
    },
    auto_install = true,
    highlight = { enable = true },
    indent = { enable = true },
  },
  build = function()
    require("nvim-treesitter.install").update({ with_sync = true })()
  end,
}
