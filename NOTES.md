# General
To enable dark mode under sway, run the following:

```bash
gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita-dark'
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
```

# Void Linux Quick Setup
Useful links:
- [https://computingforgeeks.com/void-linux-post-install-setup/]
- [https://docs.voidlinux.org/config/media/pipewire.html]

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

## Useful Aliases
Quickly enable services
```bash
enable() {
  sudo ln -s /etc/sv/"$1" /var/service/
}
```
