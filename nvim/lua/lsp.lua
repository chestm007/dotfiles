-- local lsp_installer = require "nvim-lsp-installer"
require("mason").setup()

require("mason-lspconfig").setup {
    -- ensure_installed = { "sumneko_lua" },
}

require("nvim-treesitter").install({
    "kotlin",
    "python",
    "lua"
})

local function on_attach(client, bufnr)
    local opts = { noremap = true, silent = true }
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
end

local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
vim.api.nvim_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
vim.api.nvim_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)

-- lsp_installer.on_server_ready(function(server)
--     local opts = {
--         on_attach = on_attach,
--     }
--
--     server:setup(opts)
-- end)

