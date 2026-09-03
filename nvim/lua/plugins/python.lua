return {
  {
    "nvim-neotest/neotest",
    optional = true,
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    ft = "python",
    opts = {
      adapters = {
        ["neotest-python"] = {
          runner = "pytest",
          -- python = "./.venv/bin/python",
          pytest_discover_instances = true,
          -- is_test_file = function(file_path)
          --   local M = require("neotest-python.base")
          --   local lib = require("neotest.lib")
          --
          --   local elems = vim.split(file_path, lib.files.sep)
          --   return vim.startswith(file_path, "test")
          --   -- return M.is_test_file(file_path) and vim.list_contains(elems, "test")
          -- end,
        },
      },
    },
  },
}
