#!/bin/sh
set -e
set -u

REPOSITORY_URL="https://github.com/phelrine/dotfiles.git"
DOTFILE_HOME=${HOME}/.dotfiles

if [ ! -e "${DOTFILE_HOME}" ]; then
    git clone ${REPOSITORY_URL} ${DOTFILE_HOME}
fi

cd ${DOTFILE_HOME}
sh deploy.sh
