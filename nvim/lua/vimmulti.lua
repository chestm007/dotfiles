--[[ 
Mappings
https://github.com/mg979/vim-visual-multi/wiki/Mappings#full-mappings-list
]]

local keymap = vim.g.VM_maps or {}
keymap["Find Under"]         = "<M-j>"
keymap["Find Subword Under"] = "<M-j>"
keymap["Add Cursor Down"] = "<C-M-S-down>"
keymap["Add Cursor Up"]   = "<C-M-S-up>"
vim.g.VM_maps = keymap

