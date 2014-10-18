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
plugins=(git)

source $ZSH/oh-my-zsh.sh
unsetopt correct_all

# Customize to your needs...
# Color listing
# brew install coreutils
eval $(gdircolors ~/.dircolors)
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

alias df='df -h'
alias du='du -s * -h'
alias ls='gls -ashF --color=auto'
alias ll='ls -al --color=auto'
alias host='host -av'
alias lsd='ls -ld *(-/DN)'
alias grep='grep --color=auto'
alias ack='ack-grep'
alias be='bundle exec'
alias bip='bundle install --without production'
alias ru='rbenv'

# gibo (gitignore-boilerplates) completion
# [[ -s $HOME/.gibo-completion.zsh ]] && source $HOME/.gibo-completion.zsh

# better history navigation with arrows
# http://superuser.com/a/418299/39162
bindkey '\e[A' history-beginning-search-backward
bindkey '\e[B' history-beginning-search-forward

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
