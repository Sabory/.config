export LANG=en_US.UTF-8

# Stuff needed for Tmuxp
export DISABLE_AUTO_TITLE='true'

# ANDROID STUDIO
export JAVA_HOME=$(/usr/libexec/java_home -v 11) # This will return the path to your Java installation
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

# SCRAPY PYTHON
export SCRAPY_PYTHON_SHELL="ipython"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Git Configs
export GIT_EDITOR=nvim

# Fix para Pupeteer en M1:
export PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true
export PUPPETEER_EXECUTABLE_PATH=`which chromium`

# Fix para compilar Ruby 2.6.6
export RUBY_CFLAGS="-Wno-error=implicit-function-declaration"
export PATH=$PATH:$GEM_HOME/bin

# Go Lang
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# tmuxp sessions directory
export TMUXP_CONFIGDIR=$HOME/.config/tmux/tmuxp-sessions/

export GITHUB_TOKEN= gh auth login
