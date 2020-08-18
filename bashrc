# If not running interactively, don't do anything
case $- in
  *i*) ;;
    *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'

export LYNX_CFG="$HOME/.config/lynx/lynx.cfg"
export LYNX_LSS="$HOME/.config/lynx/lynx.lss"

export PYTHONSTARTUP="$HOME/.pythonrc.py"

export FZF_DEFAULT_OPTS="--layout=reverse"

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# deno
export DENO_INSTALL="/home/mooth/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

# go
export PATH="$PATH:/usr/local/go/bin:/home/mooth/go/bin"

# my scripts
export PATH="$PATH:/mnt/c/Users/Soorria/repos/scripts"
export PATH="$HOME/.local/bin:$PATH"

export EDITOR=nvim
export VISUAL="${EDITOR}"

# =====:Aliases =====

# Git
alias g="git"
alias ga="git add"
alias gaa="git add --all"
alias gb="git branch"
alias gc="git commit"
alias gcb="git checkout -b"
alias gcm="git checkout master"
alias gcmsg="git commit -m"
alias gco="git checkout"
alias gd="git diff"
alias gf="git fetch"
alias ggpush="git push origin HEAD"
alias gl="git pull"
alias gp="git push"
alias gss="git status -s"
alias gst="git status"

# Python
alias python=python3
alias pip=pip3

# Shell Commands
alias rm="rm -Iv"
alias mv="mv -iv"
alias cp="cp -iv"

# lsd
alias ls="lsd"

# tmux
alias tm="tmux"

# vim
alias v=nvim
alias view="nvim -R"

# clock
alias clock="tty-clock -c"

alias Soorria="cd /mnt/c/Users/Soorria"
alias uni="cd /mnt/c/Users/Soorria/Documents/uni"
alias runi="cd /mnt/c/Users/Soorria/Documents/uni && ranger"

# Windows
e() {
  explorer.exe $@
}

# Stop the ghostscript thing
alias gs=""

# SPIM
spimf() {
  spim -f "${1}"
}

lolban() {
  toilet -f 3d.flf -t "$@" | lolcat
}

# lf
lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp" >/dev/null
        if [ -d "$dir" ]; then
            if [ "$dir" != "$(pwd)" ]; then
                cd "$dir"
            fi
        fi
    fi
}

# Enable vi keybindings
set -o vi

# Bash completion
eval "$(pandoc --bash-completion)"

# prompt
eval "$(starship init bash)"
