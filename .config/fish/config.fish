echo "load config.fish"

starship init fish | source
navi widget fish | source
source (pyenv init - | psub)
thefuck --alias | source 

alias ls=exa
alias tmux="tmux -u"
alias bash="FISH=1 /bin/bash"
