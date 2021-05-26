#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '

PATH=$PATH:~/.local/bin
[[ -r "/usr/share/z/z.sh" ]] && source /usr/share/z/z.sh

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
    d='drive' \
    g='git' \
    e='$EDITOR' \
    p='sudo pacman' \
    x='startx' \
    za='zathura' \

## Dotfiles
alias \
    cfg='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
