local Plug = require("pluginConf/plug")
Plug.begin()
Plug("preservim/nerdtree")
Plug("xiantang/darcula-dark.nvim", { 
    ["dependencies"] = "nvim-treesitter/nvim-treesitter" 
})
Plug("numToStr/Comment.nvim")
Plug("mg979/vim-visual-multi", { ["branch"] = "master" })
Plug("neovim/nvim-lspconfig") -- pacman -S neovim-lspconfig
Plug("nvim-treesitter/nvim-treesitter")  -- pacman -S tree-sitter-cli
Plug("mason-org/mason.nvim")
Plug("mason-org/mason-lspconfig.nvim")

Plug("vim-airline/vim-airline")
Plug("vim-airline/vim-airline-themes")

Plug("ctrlpvim/ctrlp.vim")

Plug.ends()

require("Comment").setup({
    opleader = { line = "<C-/>", block = "<C-S-/>" }
})

vim.g.NERDChristmasTree = true
vim.g.NERDTreeAutoCenter = true
vim.g.NERDTreeAutoCenterThreshold = 3

require("nerdtree")
