-- for libadwaita gtk4 apps you can use this command:
hl.exec_cmd("gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'") -- for GTK4 apps

-- for gtk3 apps you need to install adw-gtk3 theme (in arch linux sudo pacman -S adw-gtk-theme)
hl.exec_cmd("gsettings set org.gnome.desktop.interface gtk-theme 'adw-gtk3'") -- for GTK3 apps

hl.env("QT_QPA_PLATFORMTHEME", "hyprqt6engine")
