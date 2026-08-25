local function kotlin()
    vim.api.nvim_create_autocmd("Filetype", {
        pattern={"kotlin"}, command = "set cc=160"
    })
end

local function lua()
    vim.api.nvim_create_autocmd("Filetype", {
        pattern={"lua"},
        command = "set cc=80"
    })

    local lspconfig = require("lspconfig")

    lspconfig.lua_ls.setup {
      capabilities = capabilities,
    }
end

local function python()
    vim.api.nvim_create_autocmd("Filetype", {
        pattern={"python"},
        command = "set cc=160"
    })

    local lspconfig = require("lspconfig")

    lspconfig.pyright.setup {
      capabilities = capabilities,
    }

end

python()
kotlin()
lua()
