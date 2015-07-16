alias_history() {
  if [ -n "$1" ]
  then
    cat ~/.bash_history | sort -r | grep $1 | uniq | tee ~/.history_buffer | nl
  else
    history | tail -n 100
  fi
}

alias_history_buffer() {
  if [ -n "$1" ]
  then
    sed -n "$1p" ~/.history_buffer > ~/.mini_buffer
    history | grep -f ~/.mini_buffer
  fi
}

export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
export PS1="\[\e[1;31m\]\H:\u@pts/\l \[\e[0m\]\[\e[1;32m\]\d \t\[\e[0m\]\n\[\e[1;34m\]\w\e[1;32m\]\$(__git_ps1)\e[0m\] \$ "
alias l='ls -GFh'
alias ls='ls -GFh'
alias ll='ls -FGlAhp'
alias h=alias_history
alias g=alias_history_buffer

export HISTFILESIZE=
export HISTSIZE=

export GOPATH="$HOME/go"
