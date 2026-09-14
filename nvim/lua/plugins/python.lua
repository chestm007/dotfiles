return {
  { "pyright", enabled = false },
  { "nvim-neotest/neotest-python" },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "python",
      })
    end,
  },
  {
    "nvim-neotest/neotest",
    optional = true,
    dependencies = {
      "nvim-neotest/neotest-python",
    },
    opts = {
      adapters = {
        ["neotest-python"] = {
          runner = "pytest",
          is_test_file = function(file_path)
            if not vim.endswith(file_path, ".py") then
              return false
            end
            if (file_path:match("/test*/") or file_path:match("/tests/")) == nil then
              return false
            end

            local filename = vim.fn.fnamemodify(file_path, ":t")
            return vim.startswith(filename, "test_") or vim.endswith(filename, "_test.py") or filename == "conftest.py"
          end,
        },
      },
    },
  },
}
