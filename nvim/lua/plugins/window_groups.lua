-- FIXME:
-- currently broken:
--  sessions dont keep all buffers in the windows,
--  only the active ones reappear on session resume

return {
  { "akinsho/bufferline.nvim", enabled = false },
  {
    "merrebach/window-groups.nvim",
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
        excluded_filetypes = { "terminal" },
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
}
