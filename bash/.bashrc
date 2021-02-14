# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# GPG start
GPG_TTY=$(tty)
export GPG_TTY

#export TERMINAL=alacritty

LOCALBIN=$HOME/.local/bin
POETRYBIN=$HOME/.poetry/bin
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$LOCALBIN:$POETRYBIN:$PATH

# Bash Settings
PS1='[\u@\h \W]\$ '
export HISTCONTROL=ignoreboth:erasedups
export HISTIGNORE="&:?:?[ \t]*:??[ \t]:su*:sudo*:[bf]g*:exit:*-h:*--help:man*:[ \t]*"
export PROMPT_COMMAND='echo -ne "\033]0;$PWD\007"'

# Bash variables
export PAGER=less
export EDITOR=nvim
export PYTHONIOENCODING=UTF-8

#ls colors
eval "$(dircolors /etc/colors/DIR_COLORS)"

[[ -f "$HOME/.bash_aliases" ]] && source "$HOME/.bash_aliases"

eval "$(starship init bash)"
