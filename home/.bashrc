# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
*i*) ;;
*) return ;;
esac

# --------------------------------------------------------------------------
# MARK: Shell
# --------------------------------------------------------------------------

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
export HISTCONTROL=ignoreboth:erasedups

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
export HISTSIZE=1000
export HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# --------------------------------------------------------------------------
# MARK: Prompt
# --------------------------------------------------------------------------

if [[ -f ~/.config/bash/.bash_prompt ]]; then
  source ~/.config/bash/.bash_prompt
else
  PS1='\e]0;\u@\h:\w\a\u@\h:\w\n\$ '
fi

# --------------------------------------------------------------------------
# MARK: Aliases
# --------------------------------------------------------------------------

if [ -f ~/.config/bash/.bash_aliases ]; then
  source ~/.config/bash/.bash_aliases
else
  alias ll='ls -AhlF --group-directories-first --time-style=+"%_m/%d/%Y %_I:%M%P"'
  alias la='ls -AF --group-directories-first'
  alias l='ls -CF --group-directories-first'
fi

# --------------------------------------------------------------------------
# MARK: Auto Completion
# --------------------------------------------------------------------------

# Enable programmable completion features
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    source /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    source /etc/bash_completion
  fi
fi

# --------------------------------------------------------------------------
# MARK: XDG
# --------------------------------------------------------------------------

export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"

# --------------------------------------------------------------------------
# MARK: Functions
# --------------------------------------------------------------------------

[ -f ~/.config/bash/.bash_functions ] && source ~/.config/bash/.bash_functions

# --------------------------------------------------------------------------
# MARK: App Settings
# --------------------------------------------------------------------------

[ -f ~/.config/bash/.app_config ] && source ~/.config/bash/.app_config
