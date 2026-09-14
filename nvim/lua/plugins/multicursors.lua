return {
  {
    "smoka7/multicursors.nvim",
    -- event = "VeryLazy",
    dependencies = {
      "nvimtools/hydra.nvim",
    },
    opts = function(_, opts)
      table.insert(opts, {
        DEBUG_MODE = true,
        create_commands = true,
      })
    end,
    cmd = { "MCstart", "MCvisual", "MCclear", "MCpattern", "MCvisualPattern", "MCunderCursor" },
    keys = {
      {
        -- mode = { "v", "n" },
        "<leader>vm",
        "<cmd>MCstart<cr>",
        desc = "Create a selection for selected text or word under the cursor",
      },
    },
  },
}
