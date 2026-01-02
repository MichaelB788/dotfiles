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

From the home directory, execute the following:

```
chmod +x scripts/install-cli-tools.sh
./scripts/install-cli-tools.sh
```

This installs most of the CLI tools I use.

## Non-Linux Systems (MacOS / Windows)

Use Windows WSL or perish.

As for MacOS, idk I don't own a Mac.
