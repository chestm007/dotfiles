local M = {}

local function normal_windows(tabpage)
  return vim.tbl_filter(function(win)
    return vim.api.nvim_win_get_config(win).relative == ""
  end, vim.api.nvim_tabpage_list_wins(tabpage))
end

local function save_window(win)
  local groups = require("window_groups")
  local buffers = {}

  for _, bufnr in ipairs(groups.list(win)) do
    local name = vim.api.nvim_buf_get_name(bufnr)
    if name ~= "" then
      table.insert(buffers, name)
    end
  end

  return buffers
end

M.on_save = function(opts)
  local tabpages = opts.tabpage and { opts.tabpage } or vim.api.nvim_list_tabpages()
  local tabs = {}

  for _, tabpage in ipairs(tabpages) do
    local windows = {}

    for _, win in ipairs(normal_windows(tabpage)) do
      table.insert(windows, save_window(win))
    end

    table.insert(tabs, { windows = windows })
  end

  return {
    tab_scoped = opts.tabpage ~= nil,
    tabs = tabs,
  }
end

M.on_post_load = function(data)
  local tabpages = data.tab_scoped and { vim.api.nvim_get_current_tabpage() } or vim.api.nvim_list_tabpages()

  for tab_index, tabpage in ipairs(tabpages) do
    local saved_tab = data.tabs[tab_index]
    if saved_tab then
      local windows = normal_windows(tabpage)
      local saved_windows = saved_tab.windows

      -- Older saves included floating windows as empty group entries.
      if #saved_windows > #windows then
        local nonempty = vim.tbl_filter(function(buffers)
          return #buffers > 0
        end, saved_windows)
        if #nonempty == #windows then
          saved_windows = nonempty
        end
      end

      for win_index, win in ipairs(windows) do
        local saved_buffers = saved_windows[win_index]
        if saved_buffers then
          local restored = {}

          for _, name in ipairs(saved_buffers) do
            local bufnr = vim.fn.bufadd(name)
            -- These buffers came from a previously saved eligible group.
            -- Their buffer options may not be fully restored yet.
            if vim.api.nvim_buf_is_valid(bufnr) then
              table.insert(restored, bufnr)
            end
          end

          vim.api.nvim_win_set_var(win, "group_bufs", restored)
        end
      end
    end
  end
end

return M
