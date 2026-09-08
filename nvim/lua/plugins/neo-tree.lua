local fs = require("neo-tree.sources.filesystem")

-- Expand a node and load filesystem info if needed.
local function open_dir(state, dir_node)
  if dir_node.type ~= "directory" then
    return
  end
  fs.toggle_directory(state, dir_node, nil, true, false)
  vim.wait(100)
end

local function recursive_expand_if_empty(state, node)
  local stack = { node }
  while next(stack) ~= nil do
    node = table.remove(stack)
    if node.type == "directory" and not node:is_expanded() then
      open_dir(state, node)
    end
  end
end

local function toggle_neo_tree(dir)
  if vim.bo.filetype == "neo-tree" then
    require("neo-tree.command").execute({ toggle = true, dir = dir })
  else
    require("neo-tree.command").execute({ source = "filesystem", action = "focus" })
  end
end

return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "s1n7ax/nvim-window-picker",
    },
    keys = {
      {
        "<leader>e",
        function()
          toggle_neo_tree(LazyVim.root())
        end,
        desc = "Explorer NeoTree (RootDir)",
      },
      {
        "<leader>E",
        function()
          toggle_neo_tree(vim.uv.cwd())
        end,
        desc = "Explorer NeoTree (cwd)",
      },
    },
    opts = function(_, opts)
      -- dont try and open files in neotest-summary window
      table.insert(opts.open_files_do_not_replace_types, "neotest-summary")

      -- show only the line, no cursor when in the tree
      local write = vim.api.nvim_ui_send or function(s)
        return io.stdout:write(s)
      end
      opts.event_handlers = opts.event_handlers or {}
      vim.list_extend(opts.event_handlers, {
        {
          event = "neo_tree_buffer_enter",
          handler = function()
            write("\027[?25l")
          end,
        },
        {
          event = "neo_tree_buffer_leave",
          handler = function()
            write("\027[?25h")
          end,
        },
      })
    end,
  },
  {
    "s1n7ax/nvim-window-picker",
    version = "2.*",
    config = function()
      require("window-picker").setup({
        filter_rules = {
          include_current_win = false,
          autoselect_one = true,
          -- filter using buffer options
          bo = {
            -- if the file type is one of following, the window will be ignored
            filetype = { "neo-tree", "neo-tree-popup", "notify" },
            -- if the buffer type is one of following, the window will be ignored
            buftype = { "terminal", "quickfix", "neotest-summary" },
          },
        },
      })
    end,
  },
  {
    "folke/edgy.nvim",
    opts = function()
      local opts = {
        bottom = {
          {
            ft = "toggleterm",
            size = { height = 0.4 },
            filter = function(buf, win)
              return vim.api.nvim_win_get_config(win).relative == ""
            end,
          },
          {
            ft = "noice",
            size = { height = 0.4 },
            filter = function(buf, win)
              return vim.api.nvim_win_get_config(win).relative == ""
            end,
          },
          "Trouble",
          { ft = "qf", title = "QuickFix" },
          {
            ft = "help",
            size = { height = 20 },
            -- don't open help files in edgy that we're editing
            filter = function(buf)
              return vim.bo[buf].buftype == "help"
            end,
          },
          { title = "Spectre", ft = "spectre_panel", size = { height = 0.4 } },
          { title = "Neotest Output", ft = "neotest-output-panel", size = { height = 15 } },
        },
        left = {},
        right = {
          { title = "Grug Far", ft = "grug-far", size = { width = 0.4 } },
          { title = "Neotest Summary", ft = "neotest-summary" },
        },
        keys = {
          -- increase width
          ["<c-s-Right>"] = function(win)
            win:resize("width", 2)
          end,
          -- decrease width
          ["<c-s-Left>"] = function(win)
            win:resize("width", -2)
          end,
          -- increase height
          ["<c-s-Up>"] = function(win)
            win:resize("height", 2)
          end,
          -- decrease height
          ["<c-s-Down>"] = function(win)
            win:resize("height", -2)
          end,
        },
      }

      if LazyVim.has("neo-tree.nvim") then
        local pos = {
          filesystem = "left",
          buffers = "top",
          git_status = "right",
          document_symbols = "bottom",
          diagnostics = "bottom",
        }
        local sources = LazyVim.opts("neo-tree.nvim").sources or {}
        for i, v in ipairs(sources) do
          table.insert(opts.left, i, {
            title = "Neo-Tree " .. v:gsub("_", " "):gsub("^%l", string.upper),
            ft = "neo-tree",
            filter = function(buf)
              return vim.b[buf].neo_tree_source == v
            end,
            pinned = true,
            open = function()
              vim.cmd(("Neotree show position=%s %s dir=%s"):format(pos[v] or "bottom", v, LazyVim.root()))
            end,
          })
        end
      end

      -- trouble
      for _, pos in ipairs({ "top", "bottom", "left", "right" }) do
        opts[pos] = opts[pos] or {}
        table.insert(opts[pos], {
          ft = "trouble",
          filter = function(_buf, win)
            return vim.w[win].trouble
              and vim.w[win].trouble.position == pos
              and vim.w[win].trouble.type == "split"
              and vim.w[win].trouble.relative == "editor"
              and not vim.w[win].trouble_preview
          end,
        })
      end

      -- snacks terminal
      for _, pos in ipairs({ "top", "bottom", "left", "right" }) do
        opts[pos] = opts[pos] or {}
        table.insert(opts[pos], {
          ft = "snacks_terminal",
          size = { height = 0.4 },
          title = "%{b:snacks_terminal.id}: %{b:term_title}",
          filter = function(_buf, win)
            return vim.w[win].snacks_win
              and vim.w[win].snacks_win.position == pos
              and vim.w[win].snacks_win.relative == "editor"
              and not vim.w[win].trouble_preview
          end,
        })
      end
      return opts
    end,
  },
  {
    "wsdjeg/rooter.nvim",
    opts = {
      root_patterns = { ".git" },
    },
  },
}
