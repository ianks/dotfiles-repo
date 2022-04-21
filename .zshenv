# You may need to manually set your language environment
export LANG="en_US.UTF-8"

# Preferred editor
export EDITOR='nvim'

# Flags for fzf searching
export FZF_DEFAULT_COMMAND='rg --files --no-ignore-vcs --hidden --follow --glob "!.git/*" --threads 4'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# Set gpg tty
export GPG_TTY=$(tty)

# Use jk as escape in vi mode
ZVM_VI_INSERT_ESCAPE_BINDKEY=jk

# Setup rust if cargo is installed
[[ -d "$HOME/.cargo/bin" ]] && export PATH="$HOME/.cargo/bin:$PATH"
[[ -f "$HOME/.cargo/env" ]] && source "$HOME/.cargo/env"
[[ -d "$HOME/.local/bin" ]] && export PATH="$HOME/.local/bin:$PATH"

# Self update dev-machine
[[ -f "$HOME/.dev-machine/self-update" ]] && ~/.dev-machine/self-update


# Scroll through recent commands with up and down
bindkey "^[[A" history-substring-search-up
bindkey "^[[B" history-substring-search-down

# Scroll through recent commands with j and k in vim mode
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

export SKIP_COVERAGE="1"
