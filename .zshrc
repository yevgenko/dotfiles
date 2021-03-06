# tmux force UTF-8
alias tmux="tmux -u"
alias ta="tmux a"

# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

# Set to the name theme to load.
# Look in ~/.oh-my-zsh/themes/
export ZSH_THEME="ys"

# Default editor
export EDITOR="vim"

# Disable automatic terminal title
export DISABLE_AUTO_TITLE="true"

# Set to this to use case-sensitive completion
# export CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
export DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# export DISABLE_LS_COLORS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
# plugins=(git github ruby rails3 bundler cap mvn command-not-found)
plugins=(git vi-mode)

source $ZSH/oh-my-zsh.sh
unsetopt correct_all

# Customize to your needs...
# Color listing
# brew install coreutils
eval $(gdircolors ~/.dircolors)
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

alias df='df -h'
alias du='du -sh'
alias ls='gls -ashF --color=auto'
alias ll='ls -al --color=auto'
alias host='host -av'
alias lsd='ls -ld *(-/DN)'
alias grep='grep --color=auto'
# alias ack='ack-grep'
alias be='bundle exec'
alias bip='bundle install --without production'
alias ru='rbenv'
alias wiki="cd ~/code/yevgenko/wiki;printf '\033kWIKI\033\\'"
alias poh='git push origin HEAD'
alias pooh='git push -u origin HEAD'

alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"

# gibo (gitignore-boilerplates) completion
# [[ -s $HOME/.gibo-completion.zsh ]] && source $HOME/.gibo-completion.zsh

# better history navigation with arrows
# http://superuser.com/a/418299/39162
bindkey '\e[A' history-beginning-search-backward
bindkey '\e[B' history-beginning-search-forward
# specificly for the vi-mode
bindkey -M vicmd "k" history-beginning-search-backward
bindkey -M vicmd "j" history-beginning-search-forward
bindkey -M viins '^P' history-beginning-search-backward
bindkey -M viins '^N' history-beginning-search-forward
bindkey -M vicmd '/' history-incremental-search-backward
bindkey -M vicmd '?' history-incremental-search-forward
bindkey -M viins '^R' history-incremental-search-backward
bindkey -M viins '^F' history-incremental-search-forward

# User bin
path=($HOME/bin $path)

# rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# When installing the postgres gem, including ARCHFLAGS is recommended
export ARCHFLAGS="-arch x86_64"

# Bootstrap tmux session with the name of current directory
function tn() {

    if [ -z "$1" ]; then;
        session_name=$(basename `pwd`)
    else
        session_name=$1
    fi

    tmux new-session -s $session_name -n 'main'
}

# phpbrew
source ~/.phpbrew/bashrc

# Docker Environment
# export DOCKER_HOST=tcp://192.168.59.103:2376
# export DOCKER_CERT_PATH=/Users/wik/.boot2docker/certs/boot2docker-vm
# export DOCKER_TLS_VERIFY=1

# Java Home
export JAVA_HOME=$(/usr/libexec/java_home)
export JDK_HOME=$(/usr/libexec/java_home)

# Locale quick fix
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Sencha CMD
# export PATH="/Users/wik/bin/Sencha/Cmd/6.1.2.15/..:$PATH"

source $HOME/.cargo/env

##
# Kaggle Containers
##

kaggle-env(){
  eval $(docker-machine env kaggle-vbox)
}

kaggle-start(){
  docker-machine start kaggle-vbox
}

kpython(){
  kaggle-env
  docker run -v $PWD:/tmp/working -w=/tmp/working --rm -it kaggle_python_plus python "$@"
}

ikpython() {
  kaggle-env
  docker run -v $PWD:/tmp/working -w=/tmp/working --rm -it kaggle_python_plus ipython
}

kjupyter() {
  kaggle-env
  (sleep 3 && open "http://$(docker-machine ip kaggle-vbox):8888")&
  docker run -v $PWD:/tmp/working -w=/tmp/working -p 8888:8888 --rm -it kaggle_python_plus jupyter notebook --no-browser --ip="0.0.0.0" --notebook-dir=/tmp/working --allow-root
}
