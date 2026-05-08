# Setting up Void
Useful aliases to append to `.bashrc`
```bash
enable() {
  sudo ln -s /etc/sv/"$1" /var/service
}

disable() {
  sudo rm /var/service/"$1"
}
```

# Services
Enable these services:
1. dbus
2. cupsd
3. bluetoothd
    - `sudo usermod -aG <user> bluetooth`
    - Use `bluetoothctl` to manage devices
4. NetworkManger
    - Disable `dhcpcd` and `wpa_supplicant` first
    - Use `nmtui` to manage networks
5. lightdm
