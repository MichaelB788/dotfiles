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

### Dependencies

* Latest version of Neovim

* Lazygit

Optional Dependencies: 

* VSCode

* gvim

* kitty terminal

### Clone and Install

Go into a directory where you would like to clone the repo. Then execute the following:

```bash
git clone https://github.com/MichaelB788/dotfiles.git
cd dotfiles
```

### Debian

```bash
cd installers
chmod +x debian_based_installer.sh
./debian_based_installer.sh
```

### Arch

```bash
cd installers
chmod +x arch_installer.sh
./arch_installer.sh
```

### Other OS's

Manually install [Neovim](https://github.com/neovim/neovim/wiki/Building-Neovim/688be28f98c18e73b5043879b5963287a9b13d6c) and [Lazygit](https://github.com/jesseduffield/lazygit) and copy the dotfiles into the appropriate directories.
