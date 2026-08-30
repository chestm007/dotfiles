return {
  {
    "nvim-neotest/neotest",
    ft = "python",
    opts = {
      adapters = {
        require("neotest-python")({
          runner = "pytest",
          --python = "./.venv313/bin/python",
          is_test_file = function(file_path)
            local M = require("neotest-python.base")
            local lib = require("neotest.lib")

            local elems = vim.split(file_path, lib.files.sep)
            return M.is_test_file(file_path) and vim.list_contains(elems, "test")
          end,
        }),
      },
    },
  },
}
