 #!/bin/bash

 DOT_FILES=(".bash_profile" ".bashrc" ".inputrc" ".osx.bashrc" ".linux.bashrc" ".vimrc")

 for file in ${DOT_FILES[@]}
 do
    if [ -f $HOME/dotfiles/$file ]; then
    	ln -s -v  $HOME/dotfiles/$file $HOME/$file
    fi
 done

mkdir -p $HOME/.config/git
ln -s -v  $HOME/dotfiles/ignore $HOME/.config/git/ignore
