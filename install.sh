for f in .??*
do
  if [ "$f" = ".git" ]; then
    continue
  fi
  ln -snfv "$PWD"/"$f" "$HOME"/"$f" 
done
