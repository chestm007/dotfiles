vim.g.ctrlp_map = "<C-p>"
vim.g.ctrlp_cmd = "CtrlP"

vim.g.ctrlp_custom_ignore = {
    dir = "\v[\/](\.(git|hg|svn)|\_site)$",
    file = "\v\.(exe|so|dll|class|png|jpg|jpeg)$"
}

-- Use the nearest directory containing a .git as the cwd
vim.g.ctrlp_working_path_mode = 'r'
