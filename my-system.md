## Boring Crap ##
Arch Linux:
  - wifi:
    - NetworkManager
      `sudo systemctl enable --now NetworkManager`
      autorun `nm-applet` in window manager
  - lightdm
  - sway | `dot.config/sway`
    - sway tools:
      - darkman  (manage system dark/light mode)
      - rofi
      - feh  (static wallpaper)
      - mpvpaper  (ricey video wallpaper)
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
                   darkman \
                   discord \
                   htop \
                   i2ctools \
                   intellij-idea-community-edition \
                   feh \
                   lightdm \
                   lshw \
                   neovim \
                   network-manager-applet \
                   powerline \
                   pycharm-community-edition \
                   rofi-wayland \
                   spotifyd \
                   spotify-player
                   sway \
                   zsh \

    aurman -S gitkraken \
              mpvpaper \
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
    sudo pacman -S nvidia-open \
                   nvidia-prime \
                   nvidia-settings \
                   opencl-nvidia
