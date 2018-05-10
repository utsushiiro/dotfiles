alias ..='cd ..'
alias ...='cd ../..'
alias bk='cd $OLDPWD'

alias hex2dec="printf '%d\n'"
alias dec2hex="printf '%x\n'"

alias gis='git status'
alias gil='git log'
alias gia='git add'
alias gia.='git add .'
alias gic='git commit'
alias gicm='git commit -m'
alias gip='git push'

case ${OSTYPE} in
  darwin*)
    if [ -f ~/.osx_bashrc ]; then
      source ~/.osx_bashrc
    fi ;;
  linux*)
    if [ -f ~/.linux_bashrc ]; then
      source ~/.linux_bashrc
    fi ;;
esac