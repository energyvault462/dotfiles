#!/bin/bash

function link_file () {
	if (( $# > 0 )); then
		FILE=$1
		if [ -f "$HOME/.$FILE" ]; then
			mv "$HOME/.$FILE" "$HOME/.$FILE.old"
		fi
		ln -s "$PWD/$FILE" "$HOME/.$FILE"
	fi
}

$(hash git 2>/dev/null) && link_file gitconfig
$(hash git 2>/dev/null) && link_file bashrc
$(hash zsh 2>/dev/null) && link_file zshrc
