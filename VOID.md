# Void Linux Quick Setup
## Essential Services
Enable these services:
1. dbus
2. lightdm

## Optional Services
1. cupsd
2. bluetoothd
    - Add yourself to the bluetooth group, `sudo usermod -aG bluetooth <user>`
    - Use `bluetoothctl` to manage devices

## Setting up NetworkManager
1. Disable `dhcpcd` and `wpa_supplicant` first
2. Use `nmtui` to manage networks
