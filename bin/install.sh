wget "https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh" --no-clobber -P $HOME/dotfiles/etc/downloads
wget "https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash" --no-clobber -P $HOME/dotfiles/etc/downloads
mkdir -p $HOME/.vim/bundle
git clone git://github.com/Shougo/neobundle.vim $HOME/.vim/bundle/neobundle.vim
$HOME/dotfiles/bin/setlink.sh
