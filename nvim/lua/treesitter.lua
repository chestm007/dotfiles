-- autoindent
vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'kotlin', "java", "python", "lua" },
  callback = function() vim.treesitter.start() end,
})
