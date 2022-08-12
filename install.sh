#!/bin/bash

# エラーがあれば中断
set -e

# SpaceVim をインストール
# Ref: https://spacevim.org/quick-start-guide/
if [ "$(uname)" == "Linux" ]; then
  apt install -y curl tree g++
  curl -sLf https://spacevim.org/install.sh | bash
fi

# Vim のプラグインマネージャー vim-plug をインストール
# https://github.com/junegunn/vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# dotfile をコピー
for f in .??*
do
  # このリポジトリの.gitはスキップ
  if [ "$f" = ".git" ]; then
    continue
  fi
  # 以前使っていた.vimrcはスキップ　現在はSpaceVimに移行
  if [ "$f" = ".vimrc" ]; then
    continue
  fi
  # .bashrc は直接編集しない
  if [ "$f" = ".bashrc" ]; then
    ln -snfv "$PWD"/".bashrc" "$HOME"/".bashrc.dotfiles"
    # 一度編集すれば良い
    if [ -z "$DOTFILES_BASHRC_INSTALLED" ]; then
      echo 'export DOTFILES_BASHRC_INSTALLED=1' >> ~/.bashrc
      echo 'source ~/.bashrc.dotfiles' >> ~/.bashrc
      source ~/.bashrc
    fi
    continue
  fi
  # .bash_profile は直接編集しない
  if [ "$f" = ".bash_profile" ]; then
    ln -snfv "$PWD"/".bash_profile" "$HOME"/".bash_profile.dotfiles"
    # IS_EDITTED: .bash_profile を編集したかどうか
    if [ -z "$DOTFILES_BASHPROFILE_INSTALLED" ]; then
      echo 'export DOTFILES_BASHPROFILE_INSTALLED=1' >> ~/.bash_profile
      echo 'source ~/.bash_profile.dotfiles' >> ~/.bash_profile
      source ~/.bash_profile
    fi
    continue
  fi
  ln -snfv "$PWD"/"$f" "$HOME"/"$f" 
done

ln -snfv "$PWD"/".config/fish/config.fish" "$HOME"/".config/fish/config.fish"
ln -snfv "$PWD"/".config/alacritty/alacritty.yml" "$HOME"/".config/alacritty/alacritty.yml"
ln -snfv "$PWD"/".config/starship.toml" "$HOME"/".config/starship.toml"
