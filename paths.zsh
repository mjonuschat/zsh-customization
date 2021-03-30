#
# Paths
#

# Export existing paths.
typeset -gxU path PATH
typeset -gxU fpath FPATH
typeset -gxU cdpath CDPATH
typeset -gxU mailpath MAILPATH
typeset -gxU manpath MANPATH
# Create and export new paths.
typeset -gxU infopath INFOPATH
typeset -gxU node_path NODE_PATH
# Tie the new paths.
typeset -gxTU INFOPATH infopath
typeset -gxTU NODE_PATH nodepath

# Set the list of directories that zsh searches for commands.
path=(
  $HOME/bin
  $HOME/.asdf/shims
  $HOME/.cargo/bin
  /opt/homebrew/{sbin,bin}
  /usr/local/{sbin,bin}
  /usr/local/heroku/{sbin,bin}
  /usr/local/share/npm/bin
  /opt/{sbin,bin}
  /opt/local/{sbin,bin}
  /usr/{sbin,bin}
  /usr/X11R6/bin
  /{sbin,bin}
  $path
)
path=($^path(N-/))

# Set the list of directories that cd searches for directories.
setopt auto_cd
cdpath=(
  .
  $HOME
  $HOME/Documents/Development
)
cdpath=($^cdpath(N-/))

# Set the list of directories that info searches for manuals.
infopath=(
  /opt/homebrew/share/info
  /usr/local/info
  /usr/local/share/info
  /usr/share/info
)
infopath=($^infopath(N-/))

# Set the list of directories that man searches for manuals.
manpath=(
  /opt/homebrew/share/man
  /usr/local/man
  /usr/local/share/man
  /usr/share/man
)
manpath=($^manpath(N-/))

# Set the list of directories that zsh searches for mail.
mailpath=(
  $mailpath
)
mailpath=($^mailpath(N-/))

# Set the list of directories that node.js searches for modules.
nodepath=(
  /usr/local/share/npm/lib/node_modules
  /usr/local/lib/node_modules
  ./node_modules
)
