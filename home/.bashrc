# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
export PATH="$HOME/.cabal/bin/:$HOME/.local/bin:$HOME/bin:$HOME/.npm-global/bin:$PATH:/opt/gradle/gradle-6.4/bin"
export NODE_PATH="$HOME/.npm-global/lib/node_modules"

export PAGER='less -R'

alias rm='rm -i'
alias tree='tree -F'
alias less='less -R'

# export TERM=tmux-256color

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

status_color () {
    if [ $? = 0 ]; then
        echo '38;5;2'  # green
    else
        echo '38;5;1'  # red
    fi
}

export -f status_color

export PS1="\[\033[38;5;245m\][\[$(tput sgr0)\]\[\033[38;5;36m\]\u\[$(tput sgr0)\]\[\033[\`status_color\`m\]@\[$(tput sgr0)\]\[\033[38;5;147m\]\h\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;11m\]\W\[$(tput sgr0)\]\[\033[38;5;245m\]]\[$(tput sgr0)\]\[\033[38;5;15m\]\\$ \[$(tput sgr0)\]"

# For Algorithms-1's AWT GUI
export _JAVA_AWT_WM_NONREPARENTING=1
export AWT_TOOLKIT=MToolkit

function mkcd () {
    mkdir -p "$1" && cd "$1"
}

function rmcd () {
    current="$PWD" && cd - && rm -rf "$current"
}

function mkpd () {
    mkdir -p "$1" && pushd "$1"
}

function rmpd () {
    current="$PWD" && popd && rm -rf "$current"
}

export -f mkcd rmcd mkpd rmpd
