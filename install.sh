#!/bin/bash
# エラーがあれば中断
set -e
#set -x


if [ "$(uname)" == "Linux" ]; then
  apt install -y curl tree g++
  curl -sLf https://spacevim.org/install.sh | bash
fi

# Vim のプラグインマネージャー vim-plug をインストール
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# dotfile をコピー
for f in .??*
do
  if [ "$f" = ".git" ]; then
    continue
  fi
  # SpaceVimに移行したため
  if [ "$f" = ".vimrc" ]; then
    continue
  fi
  # .bashrc は直接編集しない
  if [ "$f" = ".bashrc" ]; then
    ln -snfv "$PWD"/".bashrc" "$HOME"/".bashrc.dotfiles"
    # IS_EDITTED: .bashrc を編集したかどうか 一度編集すれば良い
    if [ -z "$IS_EDITTED" ]; then
      echo 'export IS_EDITTED=1' >> ~/.bashrc
      echo 'source ~/.bashrc.dotfiles' >> ~/.bashrc
      source ~/.bashrc
    fi
    continue
  fi
  ln -snfv "$PWD"/"$f" "$HOME"/"$f" 
done

ln -snfv "$PWD"/".config/fish/config.fish" "$HOME"/".config/fish/config.fish"
ln -snfv "$PWD"/".config/alacritty/alacritty.yml" "$HOME"/".config/alacritty/alacritty.yml"
ln -snfv "$PWD"/".config/starship.toml" "$HOME"/".config/starship.toml"
