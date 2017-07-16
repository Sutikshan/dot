# :: Zplug - ZSH plugin manager
export ZPLUG_HOME=$HOME/.zplug

# Check if zplug is installed
if [[ ! -d $ZPLUG_HOME ]]; then
  git clone https://github.com/zplug/zplug $ZPLUG_HOME
  source $ZPLUG_HOME/init.zsh && zplug update --self
fi

# Essential
source $ZPLUG_HOME/init.zsh

# Zplug plugins
zplug "zplug/zplug", hook-build:"zplug --self-manage"

zplug "modules/tmux",       from:prezto
zplug "modules/history",    from:prezto
zplug "modules/utility",    from:prezto
#zplug "modules/ruby",       from:prezto
zplug "modules/ssh",        from:prezto
zplug "modules/terminal",   from:prezto
zplug "modules/editor",     from:prezto
zplug "modules/directory",  from:prezto
zplug "modules/completion", from:prezto

# zsh users
zplug "zsh-users/zsh-completions",              defer:0
zplug "zsh-users/zsh-autosuggestions",          defer:2, on:"zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting",      defer:3, on:"zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-history-substring-search", defer:3, on:"zsh-users/zsh-syntax-highlighting"

# Plugins from oh my zsh
#zplug "lib/clipboard", from:oh-my-zsh, if:"[[ $OSTYPE == *darwin* ]]"
#zplug "plugins/vi-mode", from:oh-my-zsh
zplug "plugins/git", from:oh-my-zsh
#zplug "plugins/brew", from:oh-my-zsh

# Enhanced cd
zplug "b4b4r07/enhancd", use:enhancd.sh

# Bookmarks and jump
zplug "jocelynmallon/zshmarks"

# Enhanced dir list with git features
zplug "supercrabtree/k"

# Tips for aliases
zplug "djui/alias-tips"

# Docker completion
zplug "felixr/docker-zsh-completion"

# Load theme
zplug 'halfo/lambda-mod-zsh-theme', as:theme

export ZSH_PLUGINS_ALIAS_TIPS_TEXT=' alias hint: '

# User configuration
export PATH="$HOME/.dotfiles/bin:$HOME/.bin:/usr/local/bin:$PATH"
export LANG=en_US.UTF-8
export EDITOR='vim'
export TERM="xterm-256color"
[[ -n "$SSH_CLIENT" ]] || export DEFAULT_USER="pd"
export KEYTIMEOUT=1

# :: Aliases and functions
alias l="ls"
alias ll="ls -al"
alias kk="k -a"
alias b="bookmark"
alias bd="deletemark"
alias j="jump"
alias c="clear"
alias ordermentum="cd ~/Documents/ordermentum/code/ordermentum"
alias projects="cd ~/Documents/projects"
alias dc="docker-compose"
alias vim="/usr/local/bin/vim"

# PATHS
export PATH="$PATH:`yarn global bin`"
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export EDITOR="code"
export GOPATH=$HOME/golang
export GOROOT=/usr/local/opt/go/libexec
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOPATH
export PATH=$PATH:$GOROOT/bin
export PATH="/Users/anupvarghese/Documents/terraform:$PATH"

export PATH="/Users/anupvarghese/anaconda/bin:$PATH"

# Findfile and find content
function f() { find . -iname "*$1*" ${@:2} }
function r() { grep "$1" ${@:2} -R . }


# Install plugins if there are plugins that have not been installed
if ! zplug check; then
   zplug install
fi

# Load everything
zplug load

