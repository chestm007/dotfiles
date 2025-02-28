rm -f /home/${USER}/.zshrc
rm -f /home/${USER}/.bashrc
rm -rf /home/${USER}/.vim
rm -rf /home/${USER}/.vimrc
rm -rf /home/${USER}/.viminfo
rm -rf /home/${USER}/.config/i3
rm /home/${USER}/.config/i3status
ln -s /home/${USER}/git/dotfiles/vim/.vimrc /home/${USER}/.vimrc
ln -s /home/${USER}/git/dotfiles/vim/.vim /home/${USER}/.vim
ln -s /home/${USER}/git/dotfiles/vim/.viminfo /home/${USER}/.viminfo
ln -s /home/${USER}/git/dotfiles/bash/.bashrc /home/${USER}/.bashrc
ln -s /home/${USER}/git/dotfiles/zsh/.zshrc /home/${USER}/.zshrc
ln -s /home/${USER}/git/dotfiles/dot.config/i3 /home/${USER}/.config/i3
ln -s /home/${USER}/git/dotfiles/dot.config/i3status /home/${USER}/.config/i3status
