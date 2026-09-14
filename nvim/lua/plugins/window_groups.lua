return {
  { "akinsho/bufferline.nvim", enabled = false },
  {
    "chestm007/window-groups.nvim",
    config = function()
      local wg = require("window_groups")
      wg.setup({
        keys = {
          { "<M-q>", wg.close_buf, desc = "Close buffer" },
          {
            "<M-left>",
            function()
              wg.cycle("prev")
            end,
            desc = "Previous buffer",
          },
          {
            "<M-right>",
            function()
              wg.cycle("next")
            end,
            desc = "Next buffer",
          },
          {
            "<M-S-left>",
            function()
              wg.move_buf("left")
            end,
            desc = "Move buffer left",
          },
          {
            "<M-S-right>",
            function()
              wg.move_buf("right")
            end,
            desc = "Move buffer right",
          },
        },
        exclude_filetypes = { "terminal", "filesystem" },
      })
    end,
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    lazy = true,
    opts = function(_, opts)
      opts.event_handlers = opts.event_handlers or {}
      vim.list_extend(opts.event_handlers, {
        -- assign the new buffer to the right window-group
        {
          event = "file_opened",
          ---@param path string
          handler = function(path)
            local utils = require("neo-tree.utils")
            local bufnr = utils.find_buffer_by_name(path)
            if bufnr == -1 then
              return { handled = false }
            end
            local win = vim.api.nvim_get_current_win()
            local wg = require("window_groups")
            wg.add(win, bufnr)
            return { handled = true }
          end,
        },
      })
    end,
  },
  {
    "stevearc/resession.nvim",
    dependencies = {
      "chestm007/window-groups.nvim",
    },
    opts = function(_, opts)
      opts.extensions = opts.extensions or {}
      opts.extensions.window_groups = {
        enable_in_tab = true,
      }
    end,
  },
}
