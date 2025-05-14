# 🛠️ My Dotfiles

Welcome to my personal dotfiles! This repository contains configuration files
and setup scripts for my development environment, tools, and terminal customization.

## ✨ Features

- Shell configuration: `bash`
- Editor setup: `neovim`, `vscode`, and `vim`
- Terminal emulator: `kitty`

## 🗂️ Structure

```bash
.
├── .config
│   ├── Code    # VSCode with Vim keybindings
│   │   └── User
│   │       ├── keybindings.json
│   │       └── settings.json
│   ├── kitty
│   │   └── kitty.conf
│   ├── nvim    # Neovim config
│   │   ├── init.lua
│   │   ├── lazy-lock.json
│   │   ├── lua
│   │   │   ├── config
│   │   │   │   ├── keymaps.lua
│   │   │   │   ├── lazy.lua
│   │   │   │   └── options.lua
│   │   │   └── plugins
│   │   │       ├── code.lua
│   │   │       ├── git.lua
│   │   │       ├── lsp.lua
│   │   │       ├── markdown.lua
│   │   │       ├── navigation.lua
│   │   │       └── visual-sprinkles.lua
│   │   └── .neoconf.json
│   └── .vimrc
├── installer.sh # Installer to bootstrap installation
└── README.md    # The thing you're reading from
````

## 🚀 Installation

> ⚠️ Make sure to back up your existing dotfiles before proceeding.

This installation has been tested on Linux Mint. It should work on Debian-based
distributions, or shells running on `bash`.

> *Might* work on WSL or Mac, though I haven't tested it.

### Clone and Install

Go into a directory where you would like to clone the repo. Then execute the following:

```bash
git clone https://github.com/MichaelB788/dotfiles.git
```

Then, simply run the script to make your life easier.
```bash
chmod +x installer.sh
./installer.sh
```
