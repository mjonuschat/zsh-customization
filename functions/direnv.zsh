if [[ -x $(brew --prefix)/bin/direnv ]]; then
  eval "$(direnv hook zsh)"
fi
