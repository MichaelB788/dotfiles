# Enabling Dark Mode for a Tiling Window Manager

> NOTE: This assumes the TWM is using a GTK backend 

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

## Essential Services

Enable these services to get into a desktop session:

1. dbus
2. lightdm

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

## Setting up NetworkManager

1. Disable `dhcpcd` and `wpa_supplicant` first
2. Use `nmtui` to manage networks

## Optional Services

1. [Printing](https://docs.voidlinux.org/config/print/index.html)
2. [Bluetooth](https://docs.voidlinux.org/config/bluetooth.html)
