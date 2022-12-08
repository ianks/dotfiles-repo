# You may need to manually set your language environment
export LANG="en_US.UTF-8"

# Preferred editor
export EDITOR='nvim'

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Mac specific settings, such as Rosetta config
[[ "$(uname)" == "Darwin" ]] && source "$HOME/.zshenv.mac"

# Flags for fzf searching
export FZF_DEFAULT_COMMAND='rg --files --no-ignore-vcs --hidden --follow --glob "!.git/*" --threads 4'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# Set gpg tty
export GPG_TTY=$(tty)

# Default Ruby compile opts
export RUBY_CONFIGURE_OPTS="--disable-install-doc --enable-shared --disable--install-rdoc"

# Use jk as escape in vi mode
ZVM_VI_INSERT_ESCAPE_BINDKEY=jk

# Self update dev-machine
[[ -f "$HOME/.dev-machine/self-update" ]] && ~/.dev-machine/self-update

# Scroll through recent commands with up and down
bindkey "^[[A" history-substring-search-up
bindkey "^[[B" history-substring-search-down

# Scroll through recent commands with j and k in vim mode
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

# Add things to path
export PATH="$PATH:/opt/homebrew/opt/mysql/bin"

# Export spin secrets which start with EXPORT__
if [ -d /etc/spin/secrets ]; then
  for file in /etc/spin/secrets/EXPORT__*; do
    local filename=$(basename $file)
    local with_prefix_removed=${filename#EXPORT__}

    export $with_prefix_removed="$(cat $file)"
  done
fi
