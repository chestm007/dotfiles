-----------------------------------------------------------
---Show tabs at the top of the terminal
vim.g["airline#extensions#tabline#enabled"] = 1  -- enable buffer list
vim.g["airline#extensions#tabline#fnamemod"] = ":t"  -- show just the filename

vim.o.hidden = true  -- allow buffers to be hidden if you have modified a buffer
vim.keymap.set("n", "<M-return>", ":enew<CR>")  -- Open an empty buffer

vim.keymap.set("n", "<M-right>", ":bnext<CR>")  -- Alt-right | Next buffer
vim.keymap.set("n", "<M-left>", ":bprevious<CR>")  -- Alt-left | Prev buffer
-- Close current buffer and move to the previous one
vim.keymap.set("n", "<Leader>bq", ":bp <BAR> bd #<CR>")  -- \bq
vim.keymap.set("n", "<M-q>", ":bp <BAR> bd #<CR>")  -- Alt-q
-- Show all open buffers and their status
vim.keymap.set("n", "<Leader>bl", ":ls<CR>")  -- \bl


-----------------------------------------------------------
---Windows
vim.o.splitbelow = true  -- New windows open below the current
vim.o.splitright = true  -- New windows open to the right of the current

-- navigate window
vim.keymap.set("n", "<C-up>", ":wincmd k <CR>")
vim.keymap.set("n", "<C-down>", ":wincmd j <CR>")
vim.keymap.set("n", "<C-left>", ":wincmd h <CR>")
vim.keymap.set("n", "<C-right>", ":wincmd l <CR>")

-- resize window
vim.keymap.set({"n", "t"}, "<C-S-up>", ":wincmd + <CR>")
vim.keymap.set({"n", "t"}, "<C-S-down>", ":wincmd - <CR>")
vim.keymap.set("n", "<C-S-left>", ":wincmd > <CR>")
vim.keymap.set("n", "<C-S-right>", ":wincmd < <CR>")
