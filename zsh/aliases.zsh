alias v=Nvim

function openNvim {
  if [ $# -eq 0 ]; then
    nvim ./
  else
    nvim $1
  fi
}

## GIT
alias git='LANG=en_US git'
alias guc="git reset --soft HEAD~"

# Docker
alias dcu="docker compose up"
alias dcd="docker compose down"
alias dcb="docker compose build"

# Mobile App Development
alias yb="yarn && cd ios && pod install && cd .."
alias ys="yarn start"
alias yr="yarn ios"

# Eza instead of ls
alias ls="eza --grid --color=always --long --git --no-filesize --icons=always --no-time --no-user --no-permissions --group-directories-first"

# Use Zoxide instead of lc
alias cd="z"
