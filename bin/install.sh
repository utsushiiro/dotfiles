wget "https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh" --no-clobber -P $HOME/dotfiles/etc/downloads
wget "https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash" --no-clobber -P $HOME/dotfiles/etc/downloads

exec $HOME/dotfiles/bin/setlink.sh
