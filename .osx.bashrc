export CLICOLOR=1

# ls
if which lsd > /dev/null 2>&1; then
  alias ls='lsd'
else 
  alias ls='ls -G -F'
fi
alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'

alias pwd='pwd | tee >(pbcopy)'

# cd
alias cdd='cd ~/Desktop'
alias cdc='cd `pbpaste`'

# Sublime
alias sl="subl"

# open
alias finder="open ."

# jupyter
alias note='jupyter notebook'
alias qtc='jupyter qtconsole'

# iTerm2
function it() { 
  echo -ne "\033]0;$(pwd | rev | awk -F \/ '{print $1}'| rev)\007"
}
