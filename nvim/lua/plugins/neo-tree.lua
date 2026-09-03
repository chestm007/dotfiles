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

return {
  {
    "nvim-neo-tree/neo-tree.nvim",
  },
  {
    "folke/edgy.nvim",
    -- opts = function(_, opts)
    --   -- opts.window.mappings["<Left>"] = "close_node"
    --   -- opts.window.mappings["<Right>"] = "open"
    --
    --   -- opts.window.mappings["<Right>"] = function(state)
    --   --   open_dir(state, state.tree:get_node())
    --   --   fs.refresh()
    --   -- end
    -- end,
  },
  {
    "wsdjeg/rooter.nvim",
    opts = {
      root_patterns = { ".git" },
    },
  },
}
