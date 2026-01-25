#!/bin/bash

# Safety measure, errors will arise if the user executes this command outside the home directory
cd $HOME

# The following script was taken from https://www.atlassian.com/git/tutorials/dotfiles
# Clone a BARE dotfiles repository and place it under a folder named ".cfg"
git clone --bare https://github.com/MichaelB788/dotfiles.git $HOME/.cfg
function config {
   /usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME $@
}

# Make a directory labeled ".config-backup" under the home directory in case there are any file conflicts
mkdir -p .config-backup
config checkout

if [ $? = 0 ]; then
  # No file conflicts
  echo "Checked out config.";
  else
    # Move the existing dotfiles from the machine into "$HOME/.config-backup"
    echo "Backing up pre-existing dot files.";
    config checkout 2>&1 | grep -E "\s+\." | awk {'print $1'} | xargs -I{} mv {} .config-backup/{}
fi;

# Perform another checkout in case there were any conflicting files the first time
config checkout
config config status.showUntrackedFiles no

# Create the "dot" alias command for easier access to headless git modification
echo "alias dot='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'" >> $HOME/.bashrc