# obviously you'll need to create a vm, do the normal stuff, q45 cpu thingy etc. copy the config from here 
# modify it to suit (probs just cpu config shit.
sudo pacman -S libvirt qemu-full virt-manager gamemode

# vim mkinitcpio.conf add the following
MODULES=(vfio_pci vfio vfio_iommu_type1)

# vim /etc/default/grub - add the following
GRUB_CMDLINE_LINUX="vfio_pci.ids=1002:73bf,1002:ab28"

grub-mkconfig -o /boot/grub/grub.cfg

# looking-glass - make a tempfile, this should be all.
cp 10-looking-glass.conf  /etc/tmpfiles.d/10-looking-glass.conf
systemd-tmpfiles --create /etc/tmpfiles.d/10-looking-glass.conf

# Fake display output for resolution setting
https://github.com/VirtualDrivers/Virtual-Display-Driver/releases

# to get steam to actually use the card you've isolated (after unbinding)
DXVK_FILTER_DEVICE_NAME="AMD Radeon RX 6800 XT (RADV NAVI21)" gamemoderun %command%
