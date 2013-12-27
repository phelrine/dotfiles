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
        ;;
esac

if which gem > /dev/null; then
    GEM_PATH=$(gem env | grep -e 'EXECUTABLE\sDIRECTORY' | sed -e 's/.*:\s\(.*\)/\1/')
    PATH="${GEM_PATH}:$PATH"
fi
export PATH

export PYTHONPATH=${PYTHONPATH}:${HOME}/.pythonlib/
