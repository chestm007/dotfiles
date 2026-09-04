return {
  {
    "nvim-neotest/neotest",
    ft = "kotlin",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      -- "codymikol/neotest-kotlin",
      "mgenuit/neotest-kotlin",
    },
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-kotlin").Adapter,
        },
      })
    end,
  },
}
