local utils = require("utils")
-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

---collection of helper function to set keybinds
local remap = {
  ---silent keybinds will not show the command window when executed
  silent = function(mode, lhs, rhs, opts)
    opts = opts or {}
    opts.silent = true
    vim.keymap.set(mode, lhs, rhs, opts)
  end,
}

local setup = {
  ---remove some default keybindings
  unbind = {
    lazyvim = function()
      -- move lines up and down
      remap.silent("n", "<A-j>", "")
      remap.silent("n", "<A-k>", "")
      remap.silent("i", "<A-j>", "")
      remap.silent("i", "<A-k>", "")
      remap.silent("v", "<A-j>", "")
      remap.silent("v", "<A-k>", "")
    end,
  },

  ---set keybindings
  bind = {
    navigation = function()
      -- moving between windows
      remap.silent("n", "<C-left>", ":wincmd h<CR>")
      remap.silent("n", "<C-right>", ":wincmd l<CR>")
      remap.silent("n", "<C-up>", ":wincmd k<CR>")
      remap.silent("n", "<C-down>", ":wincmd j<CR>")

      -- resizing windows
      remap.silent("n", "<C-S-left>", ":wincmd <<CR>")
      remap.silent("n", "<C-S-right>", ":wincmd ><CR>")
      remap.silent("n", "<C-S-up>", ":wincmd +<CR>")
      remap.silent("n", "<C-S-down>", ":wincmd -<CR>")

      -- moving between buffers
      remap.silent("n", "<M-left>", ":bprev<CR>")
      remap.silent("n", "<M-right>", ":bnext<CR>")

      -- go to variable definition
      remap.silent("n", "<C-Enter>", "gd", { remap = true })

      -- jump to next/prev cursor location
      remap.silent("n", "<C-M-left>", "<C-o>", { remap = true })
      remap.silent("n", "<C-M-right>", "<C-i>", { remap = true })
    end,
    comments = function()
      -- comment toggling with C-/
      remap.silent("n", "<C-/>", "gc<space>", { remap = true })
      remap.silent("v", "<C-/>", "gc", { remap = true })
    end,
    terminals = function()
      local leave = "<C-\\><C-n>"
      local function execute_command(command)
        vim.cmd(leave)
        vim.cmd(command)
        vim.cmd("startinsert")
      end

      remap.silent("n", "<A-t>", ":hor te<CR>")
      remap.silent("n", "<A-S-t>", ":vert te<CR>")

      remap.silent("t", "<Esc>", leave)
      remap.silent("t", "<C-up>", leave .. ":wincmd k<CR>")
      remap.silent("t", "<C-down>", leave .. ":wincmd j<CR>")
      remap.silent("t", "<C-left>", leave .. ":wincmd h<CR>")
      remap.silent("t", "<C-right>", leave .. ":wincmd l<CR>")
      remap.silent("t", "<C-S-up>", function()
        execute_command("wincmd -")
      end)
      remap.silent("t", "<C-S-down>", function()
        execute_command("wincmd +")
      end)
    end,
  },
}

utils.run_all(setup)
