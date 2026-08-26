local leave = "<C-\\><C-n>"

local function execute_command(command)
    vim.cmd(leave)
    vim.cmd(command)
    vim.cmd("startinsert")
end

vim.keymap.set("n", "<M-t>", ":hor te<CR>")
vim.keymap.set("n", "<M-S-t>", ":vert te<CR>")

vim.keymap.set("t", "<Esc>", leave)
vim.keymap.set("t", "<C-up>", leave..":wincmd k<CR>")
vim.keymap.set("t", "<C-down>", leave..":wincmd j<CR>")
vim.keymap.set("t", "<C-left>", leave..":wincmd h<CR>")
vim.keymap.set("t", "<C-right>", leave..":wincmd l<CR>")
vim.keymap.set("t", "<C-S-up>", function() execute_command("wincmd -") end)
vim.keymap.set("t", "<C-S-down>", function() execute_command("wincmd +") end)

vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "term://*", command = "startinsert"
})

--vim.api.nvim_create_autocmd("BufLeave", {
--    pattern = "term://*", command = "stopinsert"
--})
