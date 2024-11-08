echo "load .bash_profile"

export PS1="[\u@\h \W]\$ "
export TERM='xterm-256color'

. "$HOME/.local/bin/env"
. "$HOME/.cargo/env"
