# dotfiles

## Install
```
curl -L raw.github.com/minaminao/dotfiles/main/install.sh | bash
```

## 各dotfileのメンテナンス状況

| ファイル名               | 状態 | 状況詳細             |
| ------------------------ | ---- | -------------------- |
| .config/fish/config.fish | 🟢    | macOSで使用          |
| .config/starship.toml    | 🟢    | macOSで使用          |
| .bash_profile            | 🔴    | fishに乗り換えた     |
| .bashrc                  | 🔴    | fishに乗り換えた     |
| .tmux.conf               | 🟢    | Dockerで使用         |
| .zshenv                  | 🔴    |                      |

## 削除したdotfiles
- NOTE: 今後使うことが無いと判断したものは削除している
- .config/alacritty/alacritty.yml
- .gemrc
- .SpaceVim.d
- .vimrc
- vscode