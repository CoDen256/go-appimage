#!/bin/bash

name=$(basename $1)
clean=$(echo $name | sed 's/\.AppImage//g' | sed 's/[0-9.%_-]//g' | tr '[:upper:]' '[:lower:]')
target="$HOME/.local/bin"
if [[ -n "$name" && ! -e "/usr/local/$name" ]]; then
	( sleep 5 ; echo "mv $1 $target/$name && ln -s $target/$name $target/$clean" >> ~/stuff) &
    ( sleep 5 ; mv $1 $target && ln -s $target/$name $target/$clean) &
fi