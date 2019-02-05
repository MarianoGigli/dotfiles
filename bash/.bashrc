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
EDITOR=vim

function _update_ps1() {
    PS1=$(powerline-shell $?)
}

if [[ $TERM != linux && ! $PROMPT_COMMAND =~ _update_ps1 ]]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi

#ls colors
eval "$(dircolors /etc/colors/DIR_COLORS)"
alias ls="ls --color=auto"
alias ll="ls -l --color=auto"
alias la="ls -a --color=auto"

alias code=" proot -R ~/void-glibc code-oss /dev/null 2>&1 &"

alias supervisord-blameless='supervisord -c /home/mariano/blameless/supervisord-blameless.conf'
alias supervisorctl-blameless='supervisorctl -c /home/mariano/blameless/supervisord-blameless.conf'
