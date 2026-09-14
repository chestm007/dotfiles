return {
  {
    "nvim-orgmode/orgmode",
    event = "VeryLazy",
    config = function()
      -- Setup orgmode
      require("orgmode").setup({
        org_agenda_files = "~/orgfiles/**/*",
        org_default_notes_file = "~/orgfiles/refile.org",
        mappings = {
          prefix = "<Leader>O",
        },
      })
      -- Experimental LSP support
      vim.lsp.enable("org")
    end,
  },
  {
    "folke/which-key.nvim",
    opts = {
      spec = {
        { "<leader>O", group = "OrgMode" },
      },
    },
  },
}
