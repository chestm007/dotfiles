return {
  {
    "chestm007/overseer.nvim",
    lazy = false, -- plugin is self-lazy-loading
    cmd = {
      "OverseerOpen",
      "OverseerClose",
      "OverseerToggle",
      "OverseerRun",
      "OverseerTaskAction",
    },
    -- stylua: ignore
    keys = {
      { "<leader>pw", "<cmd>OverseerToggle!<cr>",    desc = "Task list" },
      { "<leader>po", "<cmd>OverseerRun<cr>",        desc = "Run task" },
      { "<leader>pt", "<cmd>OverseerTaskAction<cr>", desc = "Task action" },
    },
  },
  {
    "folke/which-key.nvim",
    opts = {
      spec = {
        { "<leader>p", group = "overseer" },
      },
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      sections = {
        lualine_x = { "overseer" },
      },
    },
  },
}
