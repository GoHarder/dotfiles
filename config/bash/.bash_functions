cheat() {
  curl "https://cheat.sh/$1"
}

n() {
  # Block nesting of nnn in subshells
  [ "${NNNLVL:-0}" -eq 0 ] || {
    echo "nnn is already running"
    return
  }

  # The behaviour is set to cd on quit (nnn checks if NNN_TMPFILE is set)
  # If NNN_TMPFILE is set to a custom path, it must be exported for nnn to
  # see. To cd on quit only on ^G, remove the "export" and make sure not to
  # use a custom path, i.e. set NNN_TMPFILE *exactly* as follows:
  #      NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"
  export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"

  # Unmask ^Q (, ^V etc.) (if required, see `stty -a`) to Quit nnn
  # stty start undef
  # stty stop undef
  # stty lwrap undef
  # stty lnext undef

  # The command builtin allows one to alias nnn to n, if desired, without
  # making an infinitely recursive alias
  command nnn "$@"

  [ ! -f "$NNN_TMPFILE" ] || {
    source "$NNN_TMPFILE"
    rm -f "$NNN_TMPFILE" >/dev/null
  }
}

nuke() {
  ls -A | fzf -m --layout reverse --header-first --header "Select items to permanently delete or hit 'esc' to cancel" | xargs rm -rf
}

g-a() {
  if [[ -z "$1" ]]; then
    echo "Usage: g-a <file>"
    return
  fi

  git add "$@"
  git status -s
}

g-r() {
  if [[ -z "$1" ]]; then
    echo "Usage: g-r <file>"
    return
  fi

  git restore "$@" 2>/dev/null
  git restore --staged "$@" 2>/dev/null
  git status -s
}

g-c() {
  if [[ -z "$1" ]]; then
    echo "Usage: g-c <commit message>"
    return
  fi

  git commit -m "$1"
}
