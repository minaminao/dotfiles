echo "load .bash_profile"

export PS1="[\u@\h \W]\$ "
export TERM='xterm-256color'

. "$HOME/.local/bin/env"
. "$HOME/.cargo/env"
export PATH="$PATH:/Applications/010 Editor.app/Contents/CmdLine" #ADDED BY 010 EDITOR
