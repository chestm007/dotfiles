return {
  {
    "mg979/vim-visual-multi",
    branch = "master",
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
}
