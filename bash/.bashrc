# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# BASH SETTINGS
PS1='[\u@\h \W]\$ '
HISTCONTROL=ignoreboth:erasedups
HISTIGNORE="&:?:?[ \t]*:??[ \t]:su*:sudo*:[bf]g*:exit:*-h:*--help:man*:[ \t]*"
PAGER=less

#. ~/.bash_prompt
 if [ "$TERM" != "linux" ]; then
    . ~/.bash-powerline.sh
    export TERM=xterm-256color
 fi


#ls colors
eval "$(dircolors /etc/colors/DIR_COLORS)"
alias ls="ls --color=auto"
alias ll="ls -l --color=auto"
alias la="ls -a --color=auto"

