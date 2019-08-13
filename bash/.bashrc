# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# GPG start
GPG_TTY=$(tty)
export GPG_TTY

export TERMINAL=sakura

PATH=~/.local/bin:$PATH

# BASH SETTINGS
PS1='[\u@\h \W]\$ '
export HISTCONTROL=ignoreboth:erasedups
export HISTIGNORE="&:?:?[ \t]*:??[ \t]:su*:sudo*:[bf]g*:exit:*-h:*--help:man*:[ \t]*"
export PROMPT_COMMAND='echo -ne "\033]0;$PWD\007"'

#ls colors
eval "$(dircolors /etc/colors/DIR_COLORS)"

[[ -f "$HOME/.bashrc.d/variables" ]] && source "$HOME/.bashrc.d/variables"
[[ -f "$HOME/.bashrc.d/logout" ]] && source "$HOME/.bashrc.d/logout"
[[ -f "$HOME/.bashrc.d/prompt" ]] && source "$HOME/.bashrc.d/prompt"
[[ -f "$HOME/.bashrc.d/aliases" ]] && source "$HOME/.bashrc.d/aliases"

