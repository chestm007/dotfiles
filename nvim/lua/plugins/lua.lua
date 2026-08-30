return {
  -- lazy.nvim setup
  {
    "nvim-neotest/neotest",
    ft = "lua",
    dependencies = {
      "nvim-neotest/neotest-plenary",
    },
    config = function()
      require("neotest").setup({
        projects = {
          ["~/.config/nvim"] = require("neotest-plenary")({
            min_init = "/home/max/.config/nvim/test/init.lua",
          }),
        },
        adapters = {
          require("neotest-plenary"),
        },
      })
    end,
  },
}
