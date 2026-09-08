return {
  {
    "ahmedkhalf/project.nvim",
    opts = {
      manual_mode = false, -- auto root
      detection_methods = { "lsp", "pattern" },
      patterns = {
        -- ".git", TEST: commented out as i only want to detect actual projects.
        ".pyproject.toml",
        "setup.py", -- python
        "pom.xml", -- kotlin/java
        ".luarc.json", -- lua
        ">git",
      },
      exclude_dirs = {
        "~/git/dotfiles/*",
      },
      show_hidden = true,
      silent_chdir = false,
      scope_chdir = "global",
    },
  },
}
