# nodenv
export PATH="$HOME/.nodenv/bin:$PATH"
[ -r ~/.nodenv ] && eval "$(nodenv init -)" || true

# direnv
command -v direnv &> /dev/null && eval "$(direnv hook zsh)"
