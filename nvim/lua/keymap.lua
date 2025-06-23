for key, cmd in ipairs ({
    -- Editor Tabs
    {"<M-Return>", ":enew<CR>"}, -- replaces :tabnew
    {"<M-Right>",  ":bnext<CR>"}, -- move to the next buffer
    {"<M-Left>",   ":bprevious<CR>"}  -- move to the previous buffer
}) do
    vim.keymap.set( "n", key, cmd, {noremap=true} )
end
