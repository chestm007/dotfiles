-- NOTE: disabled as it is replaced by multicursors.
return {
  {
    -- "mg979/vim-visual-multi",
    -- branch = "master",
    "eyalk11/vim-visual-multi",
    commit = "9efaa56",
    enabled = false,
    init = function()
      vim.g.VM_maps = {
        ["Find Under"] = "<A-j>",
        ["Find Prev"] = "<A-S-j>",
        ["Add Cursor Down"] = "<C-M-S-down>",
        ["Add Cursor Up"] = "<C-M-S-up>",

        ["Find Subword Under"] = "",
        ["Rewrite Last Search"] = "",
        ["Visual Reduce"] = "",
      }
      vim.g.VM_leader = "\\"
    end,
  },
  -- {
  --   "saghen/blink.cmp",
  --   opts = function(_, opts)
  --     local cmp = require("blink.cmp")
  --     vim.api.nvim_get_keymap("i")
  --     vim.api.nvim_create_autocmd("User", {
  --       pattern = "visual_multi_exit",
  --       callback = function()
  --         vim.keymap.set("i", "<CR>", function()
  --           if cmp.is_visible() then
  --             cmp.select_and_accept()
  --             return ""
  --           else
  --             return vim.api.nvim_replace_termcodes("<CR>", true, false, true)
  --           end
  --         end, { expr = true, silent = true })
  --
  --         vim.keymap.set("i", "<Up>", function()
  --           if cmp.is_visible() then
  --             cmp.select_prev()
  --             return ""
  --           else
  --             return "<Up>"
  --             -- return vim.api.nvim_replace_termcodes("<Up>", true, false, true)
  --           end
  --         end)
  --
  --         vim.keymap.set("i", "<Down>", function()
  --           if cmp.is_visible() then
  --             cmp.select_next()
  --             return ""
  --           else
  --             return "<Down>"
  --             -- return vim.api.nvim_replace_termcodes("<Down>", true, false, true)
  --           end
  --         end)
  --
  --         -- if not opts.keymap["<Tab>"] then
  --         --   if opts.keymap.preset == "super-tab" then -- super-tab
  --         --     opts.keymap["<Tab>"] = {
  --         --       require("blink.cmp.keymap.presets").get("super-tab")["<Tab>"][1],
  --         --       LazyVim.cmp.map({ "snippet_forward", "ai_nes", "ai_accept" }),
  --         --       "fallback",
  --         --     }
  --         --   else -- other presets
  --         --     opts.keymap["<Tab>"] = {
  --         --       LazyVim.cmp.map({ "snippet_forward", "ai_nes", "ai_accept" }),
  --         --       "fallback",
  --         --     }
  --         --   end
  --         -- end
  --       end,
  --     })
  --   end,
  -- },
}
