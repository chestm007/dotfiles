## Boring Crap ##
Arch Linux:
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
      - pycharm
      - python
      - intellij-idea
      - gitkraken
    - music:
      - spotifyd | `systemd/spotifyd.service`
      - spotify_player | `dot.config/spotify-player`
    - browser:
      - opera
        adblock
    - chats:
      - discord
    - system tools:
      - alsi
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
                   lshw \
                   neovim \
                   opera \
                   powerline \
                   pycharm-community-edition \
                   rofi \
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

    aurman -S amazon-coretto-11

### nvidia ###

.. code-block:: bash

    # nvidia-open only for NEWER GPU's, pretty sure its Turing onwards (TUxxx in lspci -v)
    sudo pacman -S nvidia-open \
                   nvidia-prime \
                   nvidia-settings \
                   opencl-nvidia
