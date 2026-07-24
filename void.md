# Void Linux Quick Setup

## NetworkManager Setup

[NetworkManager docs](https://docs.voidlinux.org/config/network/networkmanager.html)

```bash
sudo rm /var/service/{dhcpcd,wpa_supplicant}
sudo ln -s /etc/sv/NetworkManager /var/service
```

Configure your network with `nmtui`

## PipeWire Setup

[PipeWire docs](https://docs.voidlinux.org/config/media/pipewire.html)

The following bash snippet was taken straight from the documentation:

```bash
sudo mkdir -p /etc/pipewire/pipewire.conf.d
sudo ln -s /usr/share/examples/wireplumber/10-wireplumber.conf /etc/pipewire/pipewire.conf.d/
sudo ln -s /usr/share/examples/pipewire/20-pipewire-pulse.conf /etc/pipewire/pipewire.conf.d/
```

A system reboot is required for changes to take effect.

Make sure `pipewire` starts automatically under your WM/DE of choice.

# Optional Services

## Printing

[Printing docs](https://docs.voidlinux.org/config/print/index.html)

If the printer supports IPP Everywhere, not much setup is required:

```bash
sudo xbps-install cups cups-filters avahi nss-mdns
sudo ln -s /etc/sv/avahi-daemon /var/service
```

## Bluetooth

[Bluetooth docs](https://docs.voidlinux.org/config/bluetooth.html)

`libspa-bluetooth` is necessary for compatibility with PipeWire.

```bash
sudo xbps-install bluez libspa-bluetooth
sudo ln -s /etc/sv/bluetoothd /var/service
sudo usermod -aG bluetooth $USER
```

## Virtualization

[libvirt docs](https://docs.voidlinux.org/config/containers-and-vms/libvirt.html#libvirt)

```bash
sudo xbps-install libvirt virt-manager qemu
sudo ln -s /etc/sv/{libvirtd,virtlockd,virtlogd} /var/service
sudo usermod -aG libvirt $USER
```

# Sway Configuration

## Enabling Dark Mode

Ensure `gnome-themes-extra-gtk` is installed

```bash
gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita-dark'
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
```
## Hack to Open TUI's Under dmenu

```bash
sudo ln -s /usr/bin/kitty /usr/bin/xterm
```

For some reason, `dmenu` ignores the Sway config and defaults to using the
`xterm` binary when opening `.desktop` files.
