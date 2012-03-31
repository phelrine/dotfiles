#!/bin/sh

cd `dirname $0`
DOTFILEDIR=`pwd`

FILES=".gemrc .gitconfig .tmux.conf .zshrc .zprofile"

case $OSTYPE in
    linux*)
        FILES="${FILES} .Xresources .fonts.conf"
        ;;
esac

for f in $FILES; do
    ln -s ${DOTFILEDIR}/${f} ${HOME}/${f}
done
