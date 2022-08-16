#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

export PATH="/home/dwarf/.scripts:/home/dwarf/.scripts/dwmblocks:$PATH"
export PATH="/home/dwarf/.local/bin:$PATH"

export TERMINAL="st"
export EDITOR="nvim"
export XDG_CONFIG_HOME="$HOME/.config"

# Load Angular CLI autocompletion.
(source <(ng completion script) & ) > /dev/null 2>&1
