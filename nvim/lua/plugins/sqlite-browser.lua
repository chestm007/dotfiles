-- TODO: add command to open the most recent DB
return {
  {
    "kristijanhusak/vim-dadbod-ui",
    dependencies = {
      { "tpope/vim-dadbod", lazy = true },
      { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true }, -- Optional
    },
    cmd = {
      "DBUI",
      "DBUIToggle",
      "DBUIAddConnection",
      "DBUIFindBuffer",
    },
    init = function()
      -- Your DBUI configuration
      vim.g.db_ui_use_nerd_fonts = 1
    end,
    keys = {
      {
        mode = "n",
        "<Leader>De",
        "<cmd>DBUIToggle<cr>",
        desc = "Open Database Explorer",
      },
      {
        mode = "n",
        "<Leader>Dc",
        "<cmd>DBUIAddConnection<cr>",
        desc = "Add Database Connection",
      },
    },
  },
}
