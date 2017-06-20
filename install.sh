#!/bin/bash

function link_file () {
	if (( $# > 0 )); then
		FILE=$1
		if [ -f "$HOME/.$FILE" ]; then
			mv "$HOME/.$FILE" "$HOME/.$FILE.old"
		fi
		if ! [ -L "$HOME/.$FILE" ]; then
			ln -s "$HOME/dotfiles/$FILE" "$HOME/.$FILE"
		fi
	fi
}

$(hash git 2>/dev/null) && link_file gitconfig
$(hash git 2>/dev/null) && link_file bashrc
$(hash zsh 2>/dev/null) && link_file zshrc

