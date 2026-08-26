local Plug = require("pluginConf/plug")
Plug.begin()
Plug("preservim/nerdtree")

Plug("xiantang/darcula-dark.nvim", {
    ["dependencies"] = "nvim-treesitter/nvim-treesitter"
})

Plug("numToStr/Comment.nvim")

Plug("mg979/vim-visual-multi", { ["branch"] = "master" })

Plug("neovim/nvim-lspconfig") -- pacman -S neovim-lspconfig
Plug("hrsh7th/cmp-nvim-lsp")
Plug("ray-x/cmp-treesitter")
Plug("hrsh7th/cmp-nvim-lua")
Plug("hrsh7th/cmp-buffer")
Plug("hrsh7th/cmp-path")
Plug("hrsh7th/cmp-cmdline")
Plug("hrsh7th/nvim-cmp")
Plug("nvim-treesitter/nvim-treesitter")  -- pacman -S tree-sitter-cli
Plug("mason-org/mason.nvim")
Plug("mason-org/mason-lspconfig.nvim")

Plug("vim-airline/vim-airline")
Plug("vim-airline/vim-airline-themes")

Plug("ctrlpvim/ctrlp.vim")

Plug("nvim-telescope/telescope.nvim", { 
    ["dependencies"] = {
        "nvim-lua/plenary.lua",
        "nvim-telescope/telescope-fzf-native.nvim"
    }
})

Plug.ends()

require("Comment").setup({
    opleader = { line = "<C-/>", block = "<C-S-/>" }
})

vim.g.NERDChristmasTree = true
vim.g.NERDTreeAutoCenter = true
vim.g.NERDTreeAutoCenterThreshold = 3

require("nerdtree")
