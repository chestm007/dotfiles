
vim.api.nvim_create_autocmd("Filetype", { pattern={"python"}, command = "set cc=160"})
vim.api.nvim_create_autocmd("Filetype", { pattern={"kotlin"}, command = "set cc=160"})
vim.api.nvim_create_autocmd("Filetype", { pattern={"lua"}, command = "set cc=80"})
