 #!/bin/bash

 DOT_FILES=(".bash_profile" ".bashrc" ".inputrc" ".osx_bashrc" ".linux_bashrc")

 for file in ${DOT_FILES[@]}
 do
 	if [ -f $HOME/dotfiles/$file ]; then
    	ln -s -v  $HOME/dotfiles/$file $HOME/$file
    fi
 done
