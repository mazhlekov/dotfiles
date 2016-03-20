#!/usr/bin/env bash
# bootstrap installs things.

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

cd "$(dirname "$0")/.."
DOTFILES_ROOT=$(pwd -P)

set -e

echo ""

function info () {
    printf "\r  [ \033[00;34m..\033[0m ] $1\n"
}

function user () {
    printf "\r  [ \033[0;33m??\033[0m ] $1\n"
}

function success () {
    printf "\r\033[2K  [ \033[00;32mOK\033[0m ] $1\n"
}

function fail () {
    printf "\r\033[2K  [\033[0;31mFAIL\033[0m] $1\n"
    echo ""
    exit
}

function link_file () {
    local src=$1 dst=$2

    local overwrite= backup= skip=
    local action=

    if [ -f "$dst" -o -d "$dst" -o -L "$dst" ]
    then
        if [ "$overwrite_all" == "false" ] && [ "$backup_all" == "false" ] && [ "$skip_all" == "false" ]
        then
            local currentSrc="$(readlink $dst)"

            if [ "$currentSrc" == "$src" ]
            then
            skip=true;

            else
            user "File already exists: $dst ($(basename "$src")), what do you want to do?\n\
            [s]kip, [S]kip all, [o]verwrite, [O]verwrite all, [b]ackup, [B]ackup all?"
            read -n 1 action

            case "$action" in
                o )
                overwrite=true;;
                O )
                overwrite_all=true;;
                b )
                backup=true;;
                B )
                backup_all=true;;
                s )
                skip=true;;
                S )
                skip_all=true;;
                * )
                ;;
            esac

            fi
        fi

        overwrite=${overwrite:-$overwrite_all}
        backup=${backup:-$backup_all}
        skip=${skip:-$skip_all}

        if [ "$overwrite" == "true" ]
        then
            rm -rf "$dst"
            success "removed $dst"
        fi

        if [ "$backup" == "true" ]
        then
            mv "$dst" "${dst}.backup"
            success "moved $dst to ${dst}.backup"
        fi

        if [ "$skip" == "true" ]
        then
            success "skipped $src"
        fi
    fi

    if [ "$skip" != "true" ]  # "false" or empty
    then
        ln -s "$1" "$2"
        success "linked $1 to $2"
    fi
}

function install_dotfiles () {
    info "installing dotfiles"

    local overwrite_all=false backup_all=false skip_all=false

    for src in $(find -H "$DOTFILES_ROOT" -maxdepth 2 -name '*.ln' -not -path './.git/*')
    do
        echo ${src}
        dst="$HOME/$(basename "${src%.*}")"
        link_file "$src" "$dst"
    done
}

install_dotfiles

# If we're on a Mac, let's install and setup homebrew.
#if [ "$(uname -s)" == "Darwin" ]
#then
#    info "installing dependencies"
#    if source bin/dot > /tmp/dotfiles-dot 2>&1
#    then
#        success "dependencies installed"
#    else
#        fail "error installing dependencies"
#    fi
#fi

echo ""
echo "  All installed!"

#chsh -s /bin/zsh