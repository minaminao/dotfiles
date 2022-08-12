echo "load .bashrc"

if [ -z $FISH ]; then
  exec fish
fi
