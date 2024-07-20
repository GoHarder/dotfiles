if [ -x /usr/bin/dircolors ]; then
  test -r ~/.config/bash/.dircolors && eval "$(dircolors -b ~/.config/bash/.dircolors)" || eval "$(dircolors -b)"
  alias ls='ls --color=auto'
  alias dir='dir --color=auto'
  alias vdir='vdir --color=auto'
  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
fi

# ls
alias ll='ls -AFGhl --group-directories-first --time-style=+"%_m/%d/%Y %_I:%M%P"'
alias la='ls -AF --group-directories-first'
alias l='ls -CF --group-directories-first'

alias update='sudo nala update'
alias upgrade='sudo nala upgrade'

alias c='clear'

# git
alias g-?="echo -e '  g-? - show this help\n  g-s - show status\n  g-l - show git log\n  g-g - show git graph\n  g-a - add files to staging area\n  g-r - restore files from the staging area\n  g-c - commit changes\n  g-p - push changes to the remote repository'"
alias g-s='git status'
alias g-g='git log --all --graph --decorate --oneline'
alias g-l='git log'
alias g-p='git push'

# cd
alias ..='cd ..'

# development aliases
alias reload="source ~/.bashrc; echo -e '\e[32m▐\e[7m \e[0m Bash Reloaded'"

# keyboard shortcuts
bind '"\C-h":"cd\C-m"'       #(Ctrl + h) go to home directory
bind '"\es":"\C-asudo \C-e"' #(Esc + s) add sudo to the begining

alias wget=wget --hsts-file="$XDG_DATA_HOME/wget-hsts"
