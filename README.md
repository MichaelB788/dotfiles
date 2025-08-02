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
├── .bashrc
├── .config
│   ├── Code
│   │   └── User
│   │       └── keybindings.json
│   ├── kitty
│   │   └── kitty.conf
│   └── nvim
│       ├── init.lua
│       ├── lazy-lock.json
│       └── lua
│           ├── config
│           │   ├── keymaps.lua
│           │   ├── lazy.lua
│           │   └── options.lua
│           └── plugins
│               ├── code.lua
│               ├── git.lua
│               ├── lsp.lua
│               ├── markdown.lua
│               ├── navigation.lua
│               └── visual-sprinkles.lua
├── README.md
├── scripts
│   └── install.sh
└── .vimrc
````

## Dependencies

* git

* Latest version of Neovim

* Lazygit

* VSCode

* gvim

* kitty terminal

# Quick Install

To automate the setup, you can use this [Github Gist snippet](https://gist.github.com/8dedebc8108226650b62d7533b00b522.git) to clone these dotfiles as a bare repository 
without conflicting any existing dotfiles.

Simply open up the terminal and enter the following:

```
git clone https://gist.github.com/8dedebc8108226650b62d7533b00b522.git helper_script
chmod +x helper_script/clone.sh
./helper_script/clone.sh
```

Pre-existing dotfiles which conflict with the new ones will be placed under `~/.config-backup`

### Setup Neovim

> NOTE: This script will only run on Debian and Arch based systems, however it should be easy to configure it to work on any Linux based system.

After running the above commands to copy the config over to your machine, there should be a directory labeled `scripts/` under the home directory 
that contains another bash file that can bootstrap the installation and setup of Neovim.

From the home directory, execute the following:

```
chmod +x scripts/install-cli-tools.sh
./scripts/install-cli-tools.sh
```

## Non-Linux Systems (MacOS / Windows)

On Windows, you have the option of installing [WSL](https://learn.microsoft.com/en-us/windows/wsl/install).

> NOTE: **This is the method that I personally use, and the one that I have found the most success with**. Do this if you don't want to pull your hair out trying to fight Windows environment variables...

Otherwise, you would need to manually install [Neovim](https://github.com/neovim/neovim/wiki/Building-Neovim/688be28f98c18e73b5043879b5963287a9b13d6c) and [Lazygit](https://github.com/jesseduffield/lazygit) and copy the dotfiles into the appropriate directories.

After that, clone this repository normally:

```
git clone https://github.com/MichaelB788/dotfiles.git
```

And copy the dotfiles into their appropriate directories.

For Windows, Neovim config files are usually under `C:/User/<username>/AppData/Local/nvim`. If you don't see the `nvim`
folder, just make a new one and put the config files in there.
