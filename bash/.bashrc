# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# GPG start
GPG_TTY=$(tty)
export GPG_TTY

PATH=~/.local/bin:$PATH

# BASH SETTINGS
PS1='[\u@\h \W]\$ '
HISTCONTROL=ignoreboth:erasedups
HISTIGNORE="&:?:?[ \t]*:??[ \t]:su*:sudo*:[bf]g*:exit:*-h:*--help:man*:[ \t]*"
PAGER=less
EDITOR=nvim
export PROMPT_COMMAND='echo -ne "\033]0;$PWD\007"'
export PIPENV_VENV_IN_PROJECT=1
export PYTHONIOENCODING=UTF-8

# Prompt
[[ -f "$HOME/.bash_prompt" ]] && source "$HOME/.bash_prompt"

#ls colors
eval "$(dircolors /etc/colors/DIR_COLORS)"
alias ls="ls --color=auto"
alias ll="ls -l --color=auto"
alias la="ls -a --color=auto"

# aliases
. ~/.aliases
