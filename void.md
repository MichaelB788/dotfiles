# Enabling Dark Mode

Assuming you have `gnome-themes-extra-gtk` installed, run the following:

```bash
gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita-dark'
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
```

# Void Linux Quick Setup

## Setting up NetworkManager

1. Disable `dhcpcd` and `wpa_supplicant` first
2. Use `nmtui` to manage networks

## PipeWire Setup

See more [here](https://docs.voidlinux.org/config/media/pipewire.html)

Run the following to enable pipewire system-wide automatically.

```bash
sudo mkdir -p /etc/pipewire/pipewire.conf.d
sudo ln -s /usr/share/examples/wireplumber/10-wireplumber.conf /etc/pipewire/pipewire.conf.d/
sudo ln -s /usr/share/examples/pipewire/20-pipewire-pulse.conf /etc/pipewire/pipewire.conf.d/
```

Reboot the system after running these commands. Also, append the `pipewire`
command to any autostart script of your WM/DE.

## Optional Services

1. [Printing](https://docs.voidlinux.org/config/print/index.html)
2. [Bluetooth](https://docs.voidlinux.org/config/bluetooth.html)
