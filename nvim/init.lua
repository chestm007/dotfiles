--require("config.lazy")
require("pluginConf")

--vim.cmd.colorscheme("darcula-dark")
vim.o.tabstop = 4
vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.cmd.colorscheme("darcula-solid")
vim.g.airline_theme = "luna"
vim.o.number = true
vim.o.wrap = false -- disable line wrapping
vim.g.mapleader = " "
-- vim.o.background = "dark"

vim.g.airline_powerline_fonts = true

vim.keymap.set("n", "<space>", "za")

require("windows")
require("vimmulti")
require("lsp")
require("treesitter")
require("terminal")
require("languageSettings")
