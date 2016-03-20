# Load custom executable functions
for function in ~/dotfiles/zsh/functions/*; do
  source $function
done

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="avit"

plugins=(git colored-man colorize github vagrant brew osx zsh-syntax-highlighting go)

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# User configuration

# Make sure we have a unicode capable LANG and LC_CTYPE so the unicode
# characters does not look like crap on OSX and other environments.
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

# Help out programs spawning editors based on $EDITOR. The same for pagers,
# just use less for them.
export EDITOR=vim
export PAGER=less

# Source all of the aliases living in ~/.aliases.
#[ -f ~/.aliases ] && source ~/.aliases

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

#export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/go/bin"
# export MANPATH="/usr/local/man:$MANPATH"

[ -f $ZSH/oh-my-zsh.sh ] &&
    source $ZSH/oh-my-zsh.sh
