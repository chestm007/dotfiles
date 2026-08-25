vim.keymap.set("n", "<C-n>", ":NERDTreeToggle<CR>")

vim.api.nvim_create_autocmd("VimEnter", { pattern={"*"}, command = "NERDTree"})
vim.api.nvim_create_autocmd("VimEnter", { pattern={"*"}, command = "wincmd p"})

vim.api.nvim_create_autocmd("BufEnter", { pattern = { "*" }, callback = function()
    
end})
vim.api.nvim_create_autocmd("BufEnter", { pattern = { "*" }, command = 'if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif' })

return {
    {
        "preservim/nerdtree"
    }
}
