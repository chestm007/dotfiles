return {
  "mfussenegger/nvim-dap",
  dependencies = {
    {
      "jay-babu/mason-nvim-dap.nvim",
      event = "BufReadPre", -- <-- this
    },
  },
  opts = function()
    local dap = require("dap")
    dap.adapters.debugpy = {
      type = "executable",
      command = ".venv/bin/python",
      args = { "-m", "debugpy.adapter" },
    }
    dap.configurations.python = {
      {
        type = "debugpy",
        request = "launch",
        name = "Launch file",
        program = "${file}",
        pythonPath = function()
          return ".venv/bin/python"
        end,
      },
    }
    -- for _, language in ipairs({ "typescript", "javascript" }) do
    --   if not dap.configurations[language] then
    --     dap.configurations[language] = {
    --       {
    --         type = "node2",
    --         name = "My Custom Config"
    --       },
    --     }
    --   end
    -- end
  end,
}
