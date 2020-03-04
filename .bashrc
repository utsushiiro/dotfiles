alias ..='cd ..'
alias ...='cd ../..'
alias bk='cd $OLDPWD'

alias hex2dec="printf '%d\n'"
alias dec2hex="printf '%x\n'"

alias gis='git status'
alias gil='git log'
alias gib='git branch'
alias gick='git checkout'
alias gia='git add'
alias gia.='git add .'
alias gic='git commit'
alias gicm='git commit -m'
alias giph='git push'
alias gipl='git pull'

alias h="history | grep"

# k8s
alias k='kubectl'
alias kn='kubens'

case ${OSTYPE} in
  darwin*)
    if [ -f ~/.osx.bashrc ]; then
      source ~/.osx.bashrc
    fi ;;
  linux*)
    if [ -f ~/.linux.bashrc ]; then
      source ~/.linux.bashrc
    fi ;;
esac

if [ -f ~/.overwrite.bashrc ]; then
  source ~/.overwrite.bashrc
fi
