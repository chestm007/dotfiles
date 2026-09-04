return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      "nvim-neotest/neotest-python",
    },
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-python")({
            is_test_file = function(file_path)
              if not vim.endswith(file_path, ".py") then
                return false
              end
              if (file_path:match("/test/") or file_path:match("/tests/")) == nil then
                return false
              end
              local filename = vim.fn.fnamemodify(file_path, ":t")
              return vim.startswith(filename, "test_")
                or vim.endswith(filename, "_test.py")
                or filename == "conftest.py"
            end,
          }),
        },
      })
    end,
  },
}
