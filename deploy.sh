#!/bin/sh
set -e
set -u

DOTFILE_HOME=$(cd $(dirname $0); pwd)
FILES=".gitconfig .tmux.conf"
case $OSTYPE in
    linux*)
        FILES="${FILES} .Xresources .fonts.conf"
        ;;
esac

for f in $FILES; do
    ln -s ${DOTFILE_HOME}/${f} ${HOME}/${f}
done
