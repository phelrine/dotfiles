case $TERM in
    linux)
            LANG=C
            ;;
    *)
            LANG=ja_JP.UTF-8
            ;;
esac
export LANG

case $OSTYPE in
    darwin*)
        PYTHONPATH="/Library/Frameworks/Python.framework/Versions/2.7/bin"
        COREUTILSPATH="/usr/local/coreutils/bin"
        PATH="$PYTHONPATH:$COREUTILSPATH:$PATH"
        ;;
    *)
        PATH="${HOME}/.gem/ruby/1.9.1/bin:$PATH"
        ;;
esac
export PATH