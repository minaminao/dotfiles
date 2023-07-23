#!/bin/bash

# エラーがあれば中断
set -e

macos() {
  # ~以外にログインした場合は、依然として表示される
  touch ~/.hushlogin
}

linux() {
  # SpaceVim をインストール
  # Ref: https://spacevim.org/quick-start-guide/
  apt install -y curl tree g++
  curl -sLf https://spacevim.org/install.sh | bash
}

main() {
  if [ "$(uname)" == "Darwin" ]; then
    macos
  fi

  if [ "$(uname)" == "Linux" ]; then
    linux
  fi

  # dotfile をコピー
  find . -type f | while read -r f; do
    f=${f:2}

    if [[ "$f" == "README.md" ]] ||
      [[ "$f" == "install.sh" ]] ||
      # .git: このリポジトリの.gitはスキップ
      [[ "$f" == ".git"* ]] ||
      # .vimrc: 以前使っていた.vimrcはスキップ 現在はSpaceVimに移行
      [[ "$f" == ".vimrc"* ]] ||
      [[ "$f" == "vscode"* ]]; then
      continue
    fi

    # .bashrcは直接編集しない
    if [ "$f" = ".bashrc" ]; then
      ln -snfv "$PWD"/".bashrc" "$HOME"/".bashrc.dotfiles"
      # 一度編集すれば良い
      if [ -z "$DOTFILES_BASHRC_INSTALLED" ]; then
        echo 'export DOTFILES_BASHRC_INSTALLED=1' >>~/.bashrc
        echo 'source ~/.bashrc.dotfiles' >>~/.bashrc
        source ~/.bashrc
      fi
      continue
    fi
    # .bash_profileは直接編集しない
    if [ "$f" = ".bash_profile" ]; then
      ln -snfv "$PWD"/".bash_profile" "$HOME"/".bash_profile.dotfiles"
      # IS_EDITTED: .bash_profile を編集したかどうか
      if [ -z "$DOTFILES_BASHPROFILE_INSTALLED" ]; then
        echo 'export DOTFILES_BASHPROFILE_INSTALLED=1' >>~/.bash_profile
        echo 'source ~/.bash_profile.dotfiles' >>~/.bash_profile
        source ~/.bash_profile
      fi
      continue
    fi

    # test用: echo "ln -snfv "$PWD"/"$f" "$HOME"/"$f""
    ln -snfv "$PWD"/"$f" "$HOME"/"$f"
  done
}

main
