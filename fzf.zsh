if [[ -x $(brew --prefix)/bin/fd ]]; then
  # Setting fd as the default source for fzf
  export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow'
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

  # Use fd instead of the default find command for listing path candidates.
  _fzf_compgen_path() {
    fd --hidden --follow --exclude ".git" . "$1"
  }

  # Use fd to generate the list for directory completion
  _fzf_compgen_dir() {
    fd --type d --hidden --follow --exclude ".git" . "$1"
  }
fi

_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf "$@" --preview 'tree -C {} | head -200' ;;
    export|unset) fzf "$@" --preview "eval 'echo \$'{}" ;;
    ssh)          fzf "$@" --preview 'dig {}' ;;
    *)            fzf "$@" ;;
  esac
}
