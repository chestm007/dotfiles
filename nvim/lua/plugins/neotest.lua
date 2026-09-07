return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",

      -- python
      "nvim-neotest/neotest-python",

      -- kotlin
      -- "codymikol/neotest-kotlin",
      -- "mgenuit/neotest-kotlin",
      "chestm007/neotest-kotlin",

      -- javascript/typescript (vitest)
      "marilari88/neotest-vitest",
      "nvim-neotest/neotest-jest",
    },
    config = function()
      local neotest = require("neotest").setup({
        -- log_level = vim.log.levels.DEBUG,
        icons = {
          running_animated = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" },
        },
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

          require("neotest-kotlin").Adapter,
          -- require("neotest-kotlin").setup({
          --   root = function(dir)
          --     error(dir)
          --   end,
          --   builder = "test",
          --   is_test_file = function(file_path)
          --     vim.notify("its all fucked", vim.log.levels.INFO)
          --     return true
          --   end,
          -- }),
          require("neotest-vitest"),
          require("neotest-jest"),
        },
      })
    end,
  },
}
