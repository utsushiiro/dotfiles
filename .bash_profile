# functions used in this file
function files_exist? {
    for f in $*
    do
      if [ ! -f $f ]; then
        return 1;
      fi
    done
    return 0
}

function get_bash_version {
  echo `bash --version | head -n1 | grep --o "[0-9]*\.[0-9]*\.[0-9]*" | head -n1`
}

# bash options
bash_version=`get_bash_version`
if [[ ${bash_version:0:1} = "4"  || ${bash_version:0:1} > "4" ]]; then
  shopt -s autocd 1>/dev/null 2>/dev/null
  shopt -s globstar 1>/dev/null 2>/dev/null
fi

# key-bind
bind "\C-p":menu-complete
bind "\C-n":menu-complete-backward

# git config
src_1="$HOME/dotfiles/etc/downloads/git-prompt.sh"
src_2="$HOME/dotfiles/etc/downloads/git-completion.bash"
if files_exist? $src_1 $src_2; then
    GIT_PS1_SHOWDIRTYSTATE=true
    GIT_PS1_SHOWUNTRACKEDFILES=true
    GIT_PS1_SHOWSTASHSTATE=true
    GIT_PS1_SHOWUPSTREAM=auto
    source $src_1
    source $src_2
fi

# prompt
if [ $(id -u) -eq 0 ];
  then
    PS1='\[\e[0;35m\][\u@\h \w\] \n\[\e[0m\] \[\e[1;31m\]>> \[\e[0m\]'
  else
    if type __git_ps1 1>/dev/null 2>/dev/null;
      then
        PS1='\[\e[0;36m\][\u@\h \w\[\e[0;36m\]$(__git_ps1 " (%s)")\[\e[0;36m\]]\n\[\e[0m\] \[\e[0;32m\]>> \[\e[0m\]'
      else
        PS1='\[\e[0;36m\][\u@\h \w\[\e[0;36m\]\[\e[0;36m\]]\n\[\e[0m\] \[\e[0;32m\]>> \[\e[0m\]'
    fi
fi

### history config ###
# historyに重複したコマンドを記録しない
HISTCONTROL=ignoreboth
# history関連は記録しない。
HISTIGNORE=*history*:*his*
# 現在のセッションで利用しているhistoryの履歴数を定義する
HISTSIZE=5000
# .bash_historyで記録する履歴数を定義する
HISTFILESIZE=5000
# .bash_historyへの記録方式を追記にする
shopt -s histappend

# default editor
if which subl > /dev/null 2>&1;
  then
    export EDITOR='subl -w'
  else
    export EDITOR='vim'
fi

# add paths
export PATH=$PATH:~/bin
export PATH=/usr/local/sbin:$PATH

#### MAMP ###
# add PATH to setup cmd for MAMP(start.sh & stop.sh)
# usually, use gui-console to start servers, shouldn't use these shell scripts.
# export PATH=$PATH:/Applications/MAMP/bin/

# add PATH to use mysql&php commands in MAMP
# export PATH=$PATH:/Applications/MAMP/Library/bin
export PATH=/Applications/MAMP/bin/php/php7.1.1/bin:$PATH

# for rbenv
if which rbenv > /dev/null 2>&1; then eval "$(rbenv init -)"; fi

# for pyenv
if which pyenv > /dev/null 2>&1; then
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init -)";
fi

# for nodenv
if which nodenv > /dev/null 2>&1; then eval "$(nodenv init -)"; fi

# for direnv
if which direnv > /dev/null 2>&1; then eval "$(direnv hook bash)"; fi

# for composer
export PATH=$HOME/.composer/vendor/bin:$PATH

# for groovy
if [ -d /usr/local/opt/groovy/libexec ]; then
  export GROOVY_HOME=/usr/local/opt/groovy/libexec
fi

# for java
if which /usr/libexec/java_home > /dev/null 2>&1; then
  export JAVA_HOME=`/usr/libexec/java_home -v 1.8`
fi

# load .bashrc
if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi

# load .inputrc (readline config file)
if [ -f ~/.inputrc ]; then
  source ~/.inputrc
fi

# exec class_path.sh (java classpath setting)
if [ -f ~/dotfiles/bin/class_path.sh ]; then
  source ~/dotfiles/bin/class_path.sh
fi

#load .sshalias
if [ -f ~/.sshalias ]; then
  source ~/.sshalias
fi

# load api configurations
if [ -f ~/.api ]; then
  source ~/.api
fi

# mysql5.7 by homebrew
if ! which mysql > /dev/null 2>&1 && [ -e /usr/local/opt/mysql@5.7/bin/mysql ]; then
  export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"
fi
