#!/bin/bash

# エラーがあれば中断
set -e

macos() {
  set -x
  # ~以外にログインした場合は、依然として表示される
  touch ~/.hushlogin
  set +x
}

linux() {
  set -x
  apt install -y curl tree g++
  set +x
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
      [[ "$f" == "vscode"* ]] ||
      [[ "$f" == ".bashrc"* ]]; then
      continue
    fi

    # test用: echo "ln -snfv "$PWD"/"$f" "$HOME"/"$f""
    ln -snfv "$PWD"/"$f" "$HOME"/"$f"
  done
}

main
