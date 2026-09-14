return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "lua",
      })
    end,
  },
  { "nvim-neotest/neotest-plenary" },
  {
    "nvim-neotest/neotest",
    ft = "lua",
    opts = {
      projects = {
        ["~/.config/nvim"] = {
          ["neotest-plenary"] = {
            min_init = "/home/max/.config/nvim/test/init.lua",
          },
        },
      },
      adapters = {
        ["neotest-plenary"] = {},
      },
    },
  },
}
