# Load antigen
source ~/.config/antigen/antigen.zsh && antigen init ~/.antigenrc

# Load aliases
[[ -f ~/.aliases ]] && source ~/.aliases

if [[ -f /opt/dev/sh/chruby/chruby.sh ]]; then
  type chruby >/dev/null 2>&1 || chruby () { source /opt/dev/sh/chruby/chruby.sh; chruby "$@"; }
else
  source $(brew --prefix chruby)/share/chruby/chruby.sh
fi

[ -f /opt/dev/dev.sh ] && source /opt/dev/dev.sh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

if [ "$(uname)" = "Darwin" ]; then
  [[ -x /opt/homebrew/bin/brew ]] && eval $(/opt/homebrew/bin/brew shellenv)
fi

# Setup rust if cargo is installed
[[ -d "$HOME/.cargo/bin" ]] && export PATH="$HOME/.cargo/bin:$PATH"
[[ -f "$HOME/.cargo/env" ]] && source "$HOME/.cargo/env"
[[ -d "$HOME/.local/bin" ]] && export PATH="$HOME/.local/bin:$PATH"

chruby 3.1
[[ -f "$HOME/.config/op/plugins.sh" ]] && source "$HOME/.config/op/plugins.sh"
