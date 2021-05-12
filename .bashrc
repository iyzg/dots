#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '

PATH=$PATH:~/.local/bin

# Defaults
export EDITOR="nvim"
export TERMINAL="st"

# Aliases
## Better commands
alias \
    ls='ls --color=auto' \
    yt='youtube-dl --add-metadata -i' \
    yta="yt -x -f bestaudio/best"

## Abbreviations
alias \
    g='git' \
    e='$EDITOR' \
    p='sudo pacman' \
    z='zathura'

## Dotfiles
alias \
    cfg='/usr/bin/git --git-dir=$HOME/dots/ --work-tree=$HOME'
