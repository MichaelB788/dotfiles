# Enabling Dark Mode on Sway

To enable dark mode under sway, run the following:

```bash
gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita-dark'
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
```

# Fedora Linux Setup

## DNF Configuration

Append the following to `/etc/dnf/dnf.conf` under `[main]`

```bash
fastestmirror=True
max_parallel_downloads=10
defaultyes=True
keepcache=True
```

## Terra Repo

The Terra repo is a community-driven repo and contains many useful packages.

```bash
sudo dnf install --nogpgcheck --repofrompath 'terra,https://repos.fyralabs.com/terra$releasever' terra-release
```

## RPM Fusion and Codecs

Install both the free and non-free RPM Fusion repos

```bash
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
```

Swap out the `ffmpeg-free` package

```bash
sudo dnf swap ffmpeg-free ffmpeg --allowerasing
sudo dnf group upgrade multimedia
sudo dnf group upgrade core
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
