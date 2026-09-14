return {
  {
    "stevearc/resession.nvim",
    dependencies = {
      "merrebach/window-groups.nvim",
    },
    opts = {
      extensions = {
        window_groups = {
          enable_in_tab = true,
        },
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
