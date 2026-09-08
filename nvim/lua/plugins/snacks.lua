return {
  {
    "folke/snacks.nvim",
    keys = { -- terminal keybinds
      {
        "<A-S-t>",
        function()
          Snacks.terminal()
        end,
        desc = "Terminal (cwd)",
      },
      { -- terminal keybinds
        "<A-t>",
        function()
          Snacks.terminal(nil, { cwd = LazyVim.root() })
        end,
        desc = "Terminal (Root Dir)",
      },
    },
  },
}
