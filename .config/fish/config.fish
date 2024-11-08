set fish_greeting

set -gx DENO_INSTALL $HOME/.deno
set -gx GOPATH $HOME/go

fish_add_path $HOME/.foundry/bin
fish_add_path $HOME/.cargo/bin # instead of `. "$HOME/.cargo/env"`
fish_add_path /usr/local/opt/gettext/bin
fish_add_path /usr/local/opt/gnu-sed/libexec/gnubin
fish_add_path $HOME/google-cloud-sdk/bin
fish_add_path $HOME/.phpenv/bin
fish_add_path $HOME/.huff/bin
fish_add_path $HOME/zig
fish_add_path $DENO_INSTALL/bin
fish_add_path $HOME/.local/bin
fish_add_path $GOPATH/bin
fish_add_path $HOME/.docker/bin
fish_add_path /usr/local/opt/postgresql@16/bin
fish_add_path $HOME/.rye/shims # instead of `. "$HOME/.rye/env"`
set -x PATH "$HOME/.local/bin" $PATH

set -gx CLOUDSDK_PYTHON /Users/minami/.pyenv/versions/3.12.3/bin/python

eval "$(/opt/homebrew/bin/brew shellenv)"
starship init fish | source
navi widget fish | source
pyenv init - | source
zoxide init fish | source

alias ls=eza
alias tmux="tmux -u"
alias bash="FISH=1 /bin/bash"

export PATH="$PATH:/Users/minami/.bifrost/bin"

# pnpm
set -gx PNPM_HOME "/Users/minami/Library/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/minami/Downloads/google-cloud-sdk/path.fish.inc' ]; . '/Users/minami/Downloads/google-cloud-sdk/path.fish.inc'; end
