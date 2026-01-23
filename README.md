# Dotfiles

```bash
dotfiles
├── bootstrap.sh
├── config
│   ├── kitty
│   │   ├── current-theme.conf
│   │   ├── kitty.conf
│   │   └── kitty.conf.bak
│   └── nvim
│       ├── init.lua
│       ├── lua
│       │   ├── keymaps.lua
│       │   ├── lsp.lua
│       │   ├── options.lua
│       │   └── plugins.lua
│       └── nvim-pack-lock.json
├── ideavimrc
├── install.sh
├── README.md
└── vim
    ├── install_plug.sh
    └── vimrc
```

These are my dotfiles for EndeavorOS + SwayWM. The installation script
that that comes with this repo is heavily personalized, so no guarantee
this will work on anything I don't own.

Most of my configuration files are minimal and not at all flashy.

# Installation

Clone the repo in a nice place, preferably the home directory.

Then, run the `install.sh` script after cloning the repo:

```bash
chmod +x install.sh bootstrap.sh
./install.sh
```
