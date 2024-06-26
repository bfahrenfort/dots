# Zsh-specific environment vars go here
# PATH changes: scripts dir, interpreters dir
export PATH=$PATH:~/.local/bin:~/interpreters:~/bin

# Because Fedora is a dummy
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state
export XDG_CACHE_HOME=$HOME/.cache

# Other convenient variables
export NVIM_CONFIG=~/.config/nvim/init.lua
export NVIM_CONFIG_PATH=~/.config/nvim/lua

# Clean up the Home directory
export ANSIBLE_HOME="$XDG_DATA_HOME"/ansible
export HISTFILE="${XDG_STATE_HOME}"/bash/history
export CUDA_CACHE_PATH="$XDG_CACHE_HOME"/nv
export DOCKER_CONFIG="$XDG_CONFIG_HOME"/docker
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export ICEAUTHORITY="$XDG_CACHE_HOME"/ICEauthority
export LESSHISTFILE="$XDG_STATE_HOME"/less/history
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME"/npm/npmrc
export PYTHONSTARTUP="/etc/python/pythonrc"
export W3M_DIR="$XDG_DATA_HOME"/w3m
export WINEPREFIX="$XDG_DATA_HOME"/wine

# Rust
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
export CARGO_HOME="$XDG_DATA_HOME"/cargo
. "$CARGO_HOME/env"

# Ruby
export RBENV_ROOT="$XDG_DATA_HOME"/rbenv
export PATH="$RBENV_ROOT/bin:$PATH"
export GEM_HOME="$XDG_DATA_HOME"/gem
export GEM_SPEC_CACHE="$XDG_CACHE_HOME"/gem
export BUNDLE_USER_CONFIG="$XDG_CONFIG_HOME"/bundle
export BUNDLE_USER_CACHE="$XDG_CACHE_HOME"/bundle
export BUNDLE_USER_PLUGIN="$XDG_DATA_HOME"/bundle
eval "$(rbenv init -)"
export PATH="$RBENV_ROOT/plugins/ruby-build/bin:$PATH"

# Haskell
# export CABAL_DIR="$XDG_DATA_HOME"/cabal
export STACK_ROOT="$XDG_DATA_HOME"/stack
export GHCUP_USE_XDG_DIRS=true
[ -f "/home/b/.local/share/ghcup/env" ] && source "/home/b/.local/share/ghcup/env" # ghcup-env
export CABAL_CONFIG="$XDG_CONFIG_HOME"/cabal/config                                                             

# pnpm
export PNPM_HOME="/home/b/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
