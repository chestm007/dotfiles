return {
  {
    "stevearc/resession.nvim",
    dependencies = {
      "chestm007/window-groups.nvim",
    },
    init = function()
      -- create a session when nvim is started with no args
      local resession = require("resession")
      vim.api.nvim_create_autocmd("VimEnter", {
        callback = function()
          -- Only load the session if nvim was started with no args and without reading from stdin
          if vim.fn.argc(-1) == 0 and not vim.g.using_stdin then
            -- Save these to a different directory, so our manual sessions don't get polluted
            resession.load(vim.fn.getcwd(), { dir = "dirsession", silence_errors = true })
          end
        end,
        nested = true,
      })
      -- save the session when closing nvim
      vim.api.nvim_create_autocmd("VimLeavePre", {
        callback = function()
          resession.save(vim.fn.getcwd(), { dir = "dirsession", notify = false })
        end,
      })
      vim.api.nvim_create_autocmd("StdinReadPre", {
        callback = function()
          -- Store this for later
          vim.g.using_stdin = true
        end,
      })
      vim.api.nvim_create_autocmd("User", {
        pattern = "ResessionLoadPost",
        callback = function()
          -- Session loading restores filetype while autocmds are disabled.
          vim.cmd("filetype detect")
        end,
      })
    end,
    opts = {
      autosave = {
        enabled = true,
        interval = 30,
        notify = false,
      },
    },
    keys = {
      {
        "<leader>qs",
        function()
          require("resession").save()
        end,
        desc = "Save session",
      },
      {
        "<leader>ql",
        function()
          require("resession").load()
        end,
        desc = "Load session",
      },
      {
        "<leader>qd",
        function()
          require("resession").delete()
        end,
        desc = "Delete session",
      },
    },
  },
  {
    "folke/persistence.nvim",
    enabled = false,
  },
}
