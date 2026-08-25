#!/bin/bash

gpu="0000:03:00.0"
aud="0000:03:00.1"
gpu_vd="$(cat /sys/bus/pci/devices/$gpu/vendor) $(cat /sys/bus/pci/devices/$gpu/device)"
aud_vd="$(cat /sys/bus/pci/devices/$aud/vendor) $(cat /sys/bus/pci/devices/$aud/device)"

echo "unbinding..."
echo "$gpu_vd" | sudo tee -a "/sys/bus/pci/drivers/vfio-pci/remove_id"
echo "$aud_vd" | sudo tee -a "/sys/bus/pci/drivers/vfio-pci/remove_id"
echo 1 | sudo tee -a "/sys/bus/pci/devices/$gpu/remove"
echo 1 | sudo tee -a "/sys/bus/pci/devices/$aud/remove"
echo 1 | sudo tee -a "/sys/bus/pci/rescan"
