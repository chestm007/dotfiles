return {
  {
    "stevearc/resession.nvim",
    dependencies = {
      "chestm007/window-groups.nvim",
    },
    init = function()
      local resession = require("resession")
      local startup_session

      local function directory_argument()
        if vim.fn.argc(-1) ~= 1 then
          return nil
        end

        local argument = vim.fn.argv(0)
        if vim.fn.isdirectory(argument) ~= 1 then
          return nil
        end

        local path = vim.fn.fnamemodify(argument, ":p")
        if path ~= "/" then
          path = path:gsub("/$", "")
        end
        return path
      end

      vim.api.nvim_create_autocmd("VimEnter", {
        callback = function()
          if vim.g.using_stdin then
            return
          end

          local directory = directory_argument()
          if vim.fn.argc(-1) == 0 then
            startup_session = vim.fn.getcwd()
          elseif directory then
            vim.api.nvim_set_current_dir(directory)
            startup_session = directory
          else
            return
          end

          -- Save these to a different directory, so our manual sessions don't get polluted.
          resession.load(startup_session, { dir = "dirsession", silence_errors = true })
          if resession.get_current() ~= startup_session then
            -- Do not create a session for a directory argument when none existed.
            startup_session = nil
          end
        end,
        nested = true,
      })
      -- save the session when closing nvim
      vim.api.nvim_create_autocmd("VimLeavePre", {
        callback = function()
          if vim.fn.argc(-1) == 1 then
            if startup_session then
              resession.save(startup_session, { dir = "dirsession", notify = false })
            end
            return
          end

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
