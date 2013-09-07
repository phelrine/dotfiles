autoload -U colors; colors

if [ "${TREM}" != "dumb" ]; then
    case $USER in
        root)
            base_prompt="%B%F{red}%m%k%f"
            ;;
        *)
            base_prompt="%B%F{green}%n%f"
            ;;
    esac
    if [ -n "$SSH_CLIENT" ]; then
        base_prompt="${base_prompt}%F{cyan}@%m%k$f "
    else
        base_prompt="${base_prompt}%F{green}@%m%k%f "
    fi

    post_prompt="%f%b%k"
    path_prompt="%F{blue}%1~"
    PS1="$base_prompt$path_prompt %# $post_prompt"
    PS2="$base_prompt$path_prompt %_> $post_prompt"
    PS3="$base_prompt$path_prompt ?# $post_prompt"
fi

autoload -U compinit; compinit	# 補完を有効
# setopt auto_cd
# setopt no_clobber		# リダイレクト上書き無効
setopt auto_param_slash
setopt auto_pushd
setopt auto_resume
setopt brace_ccl
setopt correct
setopt ignore_eof
setopt list_packed
setopt magic_equal_subst
setopt mark_dirs
setopt no_flow_control		# C-s C-qを無効
setopt prompt_subst
setopt pushd_ignore_dups

zstyle ':completion:*' list-colors ''
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'	# ignore case
zstyle ':completion:*' use-cache true
zstyle ':completion:*:default' menu select=1		# 補完候補を選択
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin

fignore=(.o)

HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
setopt extended_history
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt share_history

REPORTTIME=5

bindkey -e
[[ $EMACS = t ]] && unsetopt zle

# alias
case $OSTYPE in
    darwin*)
        alias ls="ls -G"
        ;;
    *)
        alias ls="ls --color=auto"
esac
alias du="du -h"
alias df="df -h"
alias su="su -l"
alias py="python"
alias pylab="ipython --pylab"
alias asum="awk '{sum += \$1} END{print sum}'"
alias amean="awk '{sum += \$1} END{print sum/NR}'"
alias x=exit
