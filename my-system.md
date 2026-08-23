## Boring Crap ##
Arch Linux:
  - wifi:
    - NetworkManager
      `sudo systemctl enable --now NetworkManager`
      autorun `nm-applet` in window manager
  - sddm
  - hyprland
    - slack screen sharing
      pacman -S xdg-desktop-portal-hyprland
  - terminal: 
    - alacritty | `dot.config/alacritty`
    - zsh | `zsh/.zshrc`
    - bash | `bash/.bashrc`
    - powerline
  - development:
    - nvim | `nvim`
    - python
    - jetbrains-toolbox
    - gitkraken
  - music:
    - spotifyd | `systemd/spotifyd.service`
    - spotify_player | `dot.config/spotify-player`
  - browser:
    - opera | opera --enable-features=UseOzonePlatform --ozone-platform=wayland %U
      adblock
  - chats:
    - discord
  - system tools:
    - htop
    - lshw
    - i2ctools

### to install ###

.. code-block: bash

    sudo pacman -S alacritty \
                   alsi \
                   discord \
                   htop \
                   i2ctools \
                   intellij-idea-community-edition \
                   sddm \
                   lshw \
                   neovim \
                   network-manager-applet \
                   powerline \
                   pycharm-community-edition \
                   spotifyd \
                   spotify-player
                   zsh \

    aurman -S gitkraken \
              hyprland-meta-git \
              opera \
              opera-adblock-complete \
              opera-ffmpeg-codecs

## bonus crap ##

### Python ###

.. code-block:: bash

    sudo pacman -S python-build \
                   python \
                   python-pip

    aurman -S python312 \
              python311 \
              python310 \
              python39

### kotlin ###

.. code-block:: bash

    sudo pacman -S kotlin \

    aurman -S amazon-corretto-11

### nvidia ###

.. code-block:: bash

    # nvidia-open only for NEWER GPU's, pretty sure its Turing onwards (TUxxx in lspci -v)
    #   NOTE: replace nvidia-* with nvidia-*-dkms from pacman if running linux-zen kernel or 
    #         any kernel that pacman doesnt provide an nvidia-*-<KERNEL_NAME> package for.
    sudo pacman -S nvidia-open \
                   nvidia-prime \
                   nvidia-settings \
                   opencl-nvidia

### Clavo Drivers - fan control and keyboard backlights ###

.. code-block:: bash

    aurman -S clevo-drivers-dkms-git

### Hyprland from git - if you're feeling insane... ###

Packages

.. code-block:: bash

    aurman -S hyprland-git hypridle-git hyprpaper-git xdg-desktop-portal-hyprland-git

## sketchily removed packages ##

- pacman -Rs lutris
  - unzip
  - 7zip
  - cabextract
  - gnome-desktop ?
  - gnome-desktop-common ??
  - mesa-utils
  - webkit2gtk
  - woff
