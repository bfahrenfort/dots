export GTK_THEME=Layan-Light

# PATH changes: scripts dir, vscode dir, interpreters dir
export PATH=$PATH:~/.local/bin:~/interpreters:~/bin
# Other convenient variables
export NVIM_CONFIG=~/.config/nvim/lua/user/init.lua
export NVIM_CONFIG_PATH=~/.config/nvim/

# Rust
. "$HOME/.cargo/env"

# Ruby
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"

# pnpm
export PNPM_HOME="/home/b/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
