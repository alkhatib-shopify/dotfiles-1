fpath=(
"$HOME/.zfunctions"
$fpath
)

PURE_GIT_PULL=0

bindkey -e

autoload -Uz promptinit
promptinit
prompt pure

autoload -Uz compinit
compinit

autoload bashcompinit
bashcompinit

# Show completion status
# # http://stackoverflow.com/a/844299
expand-or-complete-with-dots() {
  echo -n "\e[31m...\e[0m"
  zle expand-or-complete
  zle redisplay
}
zle -N expand-or-complete-with-dots
bindkey "^I" expand-or-complete-with-dots
# Case-insensitive matching
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
# Use completion menu
zstyle ':completion:*' menu select

HISTFILE="$HOME/.zhistory"
setopt extendedglob
setopt appendhistory
setopt sharehistory
setopt incappendhistory


alias ls="ls -lFAh --group-directories-first --color=always"

export GOROOT="/usr/local/go"
export GOPATH="$HOME/go"
export PATH="$HOME/bin:$HOME/.local/bin:$HOME/.cargo/bin:$GOPATH/bin:$GOROOT/bin:$PATH"
export EDITOR="nvim"

if [[ -f /mnt/secrets/.zhistory ]]; then
    HISTFILE=/mnt/secrets/.zhistory
    export HISTFILE
fi

eval "$(direnv hook zsh)"

eval "$(jump shell)"


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
