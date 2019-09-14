#!/bin/bash
# エラーがあれば中断
set -e

# Vim のプラグインマネージャー vim-plug をインストール
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# dotfile をコピー
for f in .??*
do
  if [ "$f" = ".git" ]; then
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
