set fish_greeting

fish_add_path $HOME/.foundry/bin
fish_add_path $HOME/.cargo/bin # instead of `. "$HOME/.cargo/env"`
fish_add_path /usr/local/opt/gettext/bin
fish_add_path /usr/local/opt/gnu-sed/libexec/gnubin
fish_add_path /usr/local/Cellar/php/8.1.7/bin
fish_add_path $HOME/google-cloud-sdk/bin
fish_add_path $HOME/.phpenv/bin
fish_add_path $HOME/.huff/bin
fish_add_path $HOME/zig

set -gx CLOUDSDK_PYTHON /Users/minami/.pyenv/versions/3.7.14/bin/python

starship init fish | source
navi widget fish | source
source (pyenv init - | psub)
thefuck --alias | source 
eval "$(phpenv init -)"

alias ls=exa
alias tmux="tmux -u"
alias bash="FISH=1 /bin/bash"

set -gx RPC_ANKR_ROPSTEN https://rpc.ankr.com/eth_ropsten
set -gx RPC_ANKR_MAINNET https://rpc.ankr.com/eth
set -gx RPC_ANKR_GOERLI https://rpc.ankr.com/eth_goerli
set -gx RPC_ANKR_RINKEBY https://rpc.ankr.com/eth_rinkeby