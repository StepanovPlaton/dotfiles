#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias ll='ls -alhF'

dmenu_options="-x 5 -y 5 -z 1270 -m 0 -fn 'CodeNewRoman Nerd Font Mono:size=16:antialias=true:autohint=true' -nb '#151515' -nf '#cccccc' -sb '#151515' -sf '#e7c547'"
alias dmenu_run="dmenu_run $dmenu_options"
alias dmenu="dmenu $dmenu_options"
alias clipmenu="clipmenu $dmenu_options"
alias cm="clipmenu"

PS1='[\u@\h \W]\$ '

export PATH="/home/dwarf/.scripts:/home/dwarf/.scripts/dwmblocks:$PATH"
export PATH="/home/dwarf/.local/bin:$PATH"

export TERMINAL="st"
export EDITOR="nvim"
export XDG_CONFIG_HOME="$HOME/.config"

# Load Angular CLI autocompletion.
(source <(ng completion script) & ) > /dev/null 2>&1
