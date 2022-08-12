echo "load .bash_profile"

export PS1="[\u@\h \W]\$ "
export TERM='xterm-256color'

export PATH="$PATH:/Users/minami/.foundry/bin"
# instead of `. "$HOME/.cargo/env"`
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="/usr/local/opt/gettext/bin:$PATH"
export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
export PATH="$PATH:/usr/local/Cellar/php/8.1.7/bin"

export CLOUDSDK_PYTHON=python3
