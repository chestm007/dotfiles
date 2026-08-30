return {
  {
    "xiantang/darcula-dark.nvim",
    lazy = false,
    priority = 1000,
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "darcula-solid",
    },
  },
}
