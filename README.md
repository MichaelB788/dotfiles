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

## Quick Install - Linux

Open up the terminal and copy and paste the following command:

```
git clone https://gist.github.com/8dedebc8108226650b62d7533b00b522.git helper_script
```

This will clone a snippet of code under a directory labeled `helper_script` that will make cloning the bare
repository a lot easier.

Run the bash script included in the GitHub Gist with the following:

```
cd helper_script
chmod +x clone.sh
./clone.sh
```

The script will have copied all dotfiles into their appropriate locations. Should there be any 
conflicts between existing files or directories, the previous files will be placed under `~/.config-backup`

## Neovim Bootstrap

> NOTE: The following script has only been tested on Debian and Arch based systems. This script will not run on any other distro normally.

After running the above commands to copy the config over to your machine, there should be a directory labeled `scripts/` 
that contains another bash file that can bootstrap the installation and setup of Neovim.

From the home directory, execute the following:

```
cd scripts
chmod +x clone.sh
./clone.sh
```

## Non-Linux Systems (MacOS / Windows)

On Windows, you have the option of installing [WSL](https://learn.microsoft.com/en-us/windows/wsl/install). I recommend installing Ubuntu, running
the Neovim bootstrap script should work out of the box.

Otherwise, you would need to manually install [Neovim](https://github.com/neovim/neovim/wiki/Building-Neovim/688be28f98c18e73b5043879b5963287a9b13d6c) and [Lazygit](https://github.com/jesseduffield/lazygit) and copy the dotfiles into the appropriate directories.
for your system.

After that, clone this repository normally:

```
https://github.com/MichaelB788/dotfiles.git
```

And copy the dotfiles into their appropriate directories.
