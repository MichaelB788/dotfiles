# Dotfiles

These are my dotfiles for Vim, Neovim, and kitty, as well as any personal
scripts that I may or may not use. If you happen to be a lurker, I encourage
you to take inspiration if you wish. **All of my dotfiles can be found in the
`modules/` directory**.

Do note: Most of my configuration files are minimal and not at all flashy.

# Installation

> WARN: The installation script only works on Arch based distributions. Making
a global script is a pain so I'd rather not bother.

Clone the repo in a nice place, preferably the home directory.

Then, assuming you are in the `dotfiles/` directory, run the following:

```bash
chmod +x bootstrap.sh scripts/pacman.sh scripts/stow-dotfiles.sh scripts/yay.sh
./bootstrap.sh
```

The script should stow the dotfiles and install any packages I use. I
encourage you to look at `scripts/pacman.sh` and `scripts/yay.sh` to see which
packages are installed.

## Notes

Most of my configuration files are minimal. They are not meant to be fancy,
they are just meant to work.

Neovim does not use lazy.nvim because I much prefer the native package manager
introduced in Neovim nightly. That and I don't like the idea of relying on a
plugin mostly maintained by one dude for all of my other plugins.

If you take a look under my `.vim` folder (which should be placed in the home
directory), you should see a script called `install_plug.sh`. All this does is
clone the git repo to all the vim plugins I use under `pack/vendor/` to best
utilize the native package manager. **I highly recommend running this after
a fresh install**.
