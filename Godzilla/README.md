### Kernel Drivers:

- nct6775
  - Motherboard sensor driver

### kernel parameters:

- vfio_pci.ids: binds the IGPU on my 9950X3D to vfio drivers for pci passthrough
- mitigations=off: disables alot of cpu security mitigations
- iommu=pt: enables passthrough mode for I/O Memory Management Unit, allowing direct
  memory access without routing through IOMMU - more fast, less secure

```
# /etc/default/grub
GRUB_CMDLINE_LINUX="... split_lock_detect=off vfio_pci.ids=1002:13c0,1002:1640 amdgpu.aspm=0 mitigations=off iommu=pt"
```

### Other Tweaks:
- sudoless dmesg (sysctl.d drop-in file)[etc/sysctl.d/01-dmesg.conf.txt]
