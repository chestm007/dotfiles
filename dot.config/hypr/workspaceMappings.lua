---------------------------------
-- Bind Workspaces to Monitors --
---------------------------------
hl.workspace_rule({ workspace = 1, monitor = "DP-10"})
hl.workspace_rule({ workspace = 2, monitor = "DP-9"})
hl.workspace_rule({ workspace = 3, monitor = "DP-10"})
hl.workspace_rule({ workspace = 4, monitor = "DP-10"})
hl.workspace_rule({ workspace = 5, monitor = "DP-10"})
hl.workspace_rule({ workspace = 6, monitor = "DP-10"})
hl.workspace_rule({ workspace = 7, monitor = "DP-10"})
hl.workspace_rule({ workspace = 8, monitor = "DP-10"})
hl.workspace_rule({ workspace = 9, monitor = "DP-10"})
hl.workspace_rule({ workspace = 0, monitor = "DP-10"})

--------------------------------
-- Bind Windows to Workspaces --
--------------------------------
hl.window_rule({
  match = {
    class = "Opera|vivaldi-stable"
  },
  float = 0,
  workspace = 1
})

hl.window_rule({
  match = {
    class = "slack|Caprine|Spotify"
  },
  float = 0,
  workspace = 2
})

hl.window_rule({
  match = {
    class = "jetbrains-pycharm"
  },
  workspace = 3
})

hl.window_rule({
  match = {
    class = "gitkraken"
  },
  float = 0,
  workspace = 9
})

--------------------------
-- Jetbrains Annoyances --
--------------------------
hl.window_rule({
  match = {
    class = "gitkraken"
  },
  float = 0,
  workspace = 9
})


-- Old Legacy code from hyprlang that hasnt been ported to lua yet.

--windowrule = no_anim = true, match:workspace = 3
--windowrule = no_initial_focus on, match:xwayland true  # https://wiki.archlinux.org/title/Hyprland#Jetbrains_apps_focus_issues
