# Quick Install

## Step 1: Copy the headless repo

[Link to the Github Gist snippet](https://gist.github.com/8dedebc8108226650b62d7533b00b522.git)

Execute the following

```bash
git clone https://gist.github.com/8dedebc8108226650b62d7533b00b522.git helper_script
chmod +x helper_script/clone.sh
./helper_script/clone.sh
```

A folder named `~/.config-backup` will be created. Original files will be placed there, given that they conflict
with any config files.

## Optional Step 2: Install CLI Tools

Under the `scripts/` directory, you may find a file named `install-cli-tools.sh`.

Make it an exe and run it with a flag:

- `--eos` -> EndeavorOS (Arch could also work, you just need `yay` installed)
- `--fedora` -> self-explanatory
- `deb` -> Debian, or any of its 20 derivatives

## Non-Linux Systems (MacOS / Windows)

Use Windows WSL or perish.

As for MacOS, idk I don't own a Mac.
