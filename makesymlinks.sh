#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=~/dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory
files="vimrc tmux.conf i3" # list of files/folders to symlink in homedir

##########

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir

# change to the dotfiles directory
# echo -n "Changing to the $dir directory ..."
# cd $dir

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks from the homedir to any files in the ~/dotfiles directory specified in $files
for file in $files; do
  if [ -f "$file" ];
  then
    echo "Moving $file from ~ to $olddir"
    mv ~/.$file ~/dotfiles_old/
  else
    echo "$file does not already exist"
  fi
  echo "Creating symlink to $file"
  ln -s $dir/$file ~/.$file
done
