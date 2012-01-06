export LANG=ja_JP.UTF-8

case $OSTYPE in
    darwin*)
        PYTHONPATH="/Library/Frameworks/Python.framework/Versions/2.7/bin"
        COREUTILSPATH="/usr/local/coreutils/bin"
        PATH="$PYTHONPATH:$COREUTILSPATH:$PATH"
        export PATH
        ;;
    *)
        ;;
esac
