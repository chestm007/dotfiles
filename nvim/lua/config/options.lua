-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local opt = vim.opt
local cmd = vim.api.nvim_create_autocmd

opt.relativenumber = false
opt.tabstop = 4
opt.shiftwidth = 4

cmd({ "FileType" }, {
  pattern = { "lua" },
  callback = function()
    opt.tabstop = 2
    opt.shiftwidth = 2
  end,
})
