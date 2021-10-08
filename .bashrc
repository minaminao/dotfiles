export PS1="[\u@\h \W]\$ "
export TERM='xterm-256color'

alias ls=exa

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"

if [ -z $FISH ]; then
  exec fish
fi
