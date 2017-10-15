set -e

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

for f in .??*
do
  if [ "$f" = ".git" ]; then
    continue
  fi
  # .bashrc に追加の設定を反映
  if [ "$f" = ".bashrc" ]; then
    ln -snfv "$PWD"/".bashrc" "$HOME"/".bashrc.dotfiles"
    if [ -z "$IS_EDITTED" ]; then
      echo 'export IS_EDITTED=1' >> ~/.bashrc
      echo 'source ~/.bashrc.dotfiles' >> ~/.bashrc
      source ~/.bashrc
    fi
    continue
  fi
  ln -snfv "$PWD"/"$f" "$HOME"/"$f" 
done
