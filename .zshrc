# System Paths & Version Managers
export PATH="$PATH:/Library/Developer/CommandLineTools/Library/Frameworks/Python3.framework/Versions/3.9/bin"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # Loads NVM
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # Loads NVM completion

# Prompt & Tools Initialization
source <(fzf --zsh)

# Modern Command Aliases
alias v="nvim"

# Compiler & Execution Shortcuts
alias ccw="cc -Wall -Wextra -Werror"
alias run="./a.out"
alias ccrun="ccw *.c && ./a.out"

alias gs="git status"
alias ga="git add ."
alias gc="git commit -m "
alias gp="git push"

# Quick Directory & Config Shortcuts
alias ..="cd .."
alias ...="cd ../.."
alias reload="source ~/.zshrc"
alias zsh="vim ~/.zshrc"

if [[ "$TERM_PROGRAM" == "ghostty" || -n "$TMUX" ]]; then
	alias ls="eza --icons --group-directories-first"
	alias ll="eza -la --icons --git"
	eval "$(starship init zsh)"
fi

# added by bro42 install.sh
export PATH="$HOME/.local/bin:$PATH"
