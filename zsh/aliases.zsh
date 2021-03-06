##
# Aliases
#

# some more ls aliases
alias l="ls -CF"
alias ll="ls -l"
alias la="ls -A"
alias lh="ls -lh"
alias lash="ls -lAsh"
alias sl="ls"

# Make unified diff syntax the default
alias diff="diff -u"

# simple webserver
alias mkhttp="python -m http.server"

# json prettify
alias json="python -m json.tool"

# octal+text permissions for files
alias perms="stat -c '%A %a %n'"

# expand sudo aliases
alias sudo="sudo "

###########
# ALIASES #
###########
alias qq="cd . && source ~/.zshrc"
alias cp="cp -iv"
alias rm="rm -iv"
alias mv="mv -iv"
alias ls="ls -FGh"
alias du="du -cksh"
alias df="df -h"
# Use modern regexps for sed, i.e. "(one|two)", not "\(one\|two\)"
alias sed="sed -E"
# Copy-pasting `$ python something.py` works
alias \$=''
alias diff="colordiff -u"
alias mkdir="\mkdir -p"

alias prettyjson="python -m json.tool"
alias prettyxml="xmllint --format -"

alias dotfiles="cd ~/.dotfiles"
alias dotfiles-update="cd ~/.dotfiles && git checkout master && git pull && git checkout - && cd -"
alias ghostname=hostname

# Needs to be a function because `alias -` breaks
function -() { cd - }

# Global aliases
alias -g G="| grep "
alias -g ONE="| awk '{ print \$1}'"

# Psh, "no nodename or servname not provided". I'll do `whois
# http://google.com/hello` if I want.
function whois() {
  command whois $(echo "$1" | sed -E -e 's|^https?://||' -e 's|/.*$||g')
}

function al { ls -t | head -n ${1:-10}; }

# If piping something in, copy it.
# If just doing `clip`, paste it.
function clip { [ -t 0 ] && pbpaste || pbcopy;}
