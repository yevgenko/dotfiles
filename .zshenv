typeset -U path
# path=(~/bin ~/.local/bin /usr/local/bin /usr/local/heroku/bin $path)

# Seems like we've it in .zshrc already
# [[ -s $HOME/.rbenv/bin ]] && path=($HOME/.rbenv/bin $path) && eval "$(rbenv init -)"

# Anaconda2 4.0.0 installer
# export PATH="/Users/wik/anaconda/bin:$PATH"
[[ -s $HOME/anaconda ]] && path=($HOME/anaconda/bin $path)

# Sencha CMD
[[ -s $HOME/bin/Sencha/Cmd/6.1.2.15 ]] && path=($HOME/bin/Sencha/Cmd/6.1.2.15/.. $path)

# typeset -U fpath
# fpath=(~/.zsh-completions $fpath)

[[ -s /usr/local/opt/qt@5.5/bin ]] && path=(/usr/local/opt/qt@5.5/bin $path)
