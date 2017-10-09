curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

for f in .??*
do
  if [ "$f" = ".git" ]; then
    continue
  fi
  ln -snfv "$PWD"/"$f" "$HOME"/"$f" 
done
