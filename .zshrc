# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

# Set to the name theme to load.
# Look in ~/.oh-my-zsh/themes/
export ZSH_THEME="herself"
zstyle ':completion:*' file-sort time

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(vi-mode)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:/opt/metasploit:/usr/bin/vendor_perl:/usr/bin/core_perl

setopt completeinword          # not just at the end

autoload zkbd
__git_files () {
  _wanted files expl 'local files' _files
}

#zkbd config:
#run zsh -f /usr/share/zsh/4.3.5/functions/Misc/zkbd

#echo ~/.zkbd/$TERM-$VENDOR-$OSTYPE
source /home/barnex/.zkbd/xterm-256color-:0 
# setup key accordingly
export TERM=xterm-256color


bindkey -v
[[ -n "${key[Home]}"    ]]  && bindkey  "${key[Home]}"    beginning-of-line
[[ -n "${key[End]}"     ]]  && bindkey  "${key[End]}"     end-of-line
[[ -n "${key[Insert]}"  ]]  && bindkey  "${key[Insert]}"  overwrite-mode
[[ -n "${key[Delete]}"  ]]  && bindkey  "${key[Delete]}"  delete-char
[[ -n "${key[Up]}"      ]]  && bindkey  "${key[Up]}"      up-line-or-history
[[ -n "${key[Down]}"    ]]  && bindkey  "${key[Down]}"    down-line-or-history
[[ -n "${key[Left]}"    ]]  && bindkey  "${key[Left]}"    backward-char
[[ -n "${key[Right]}"   ]]  && bindkey  "${key[Right]}"   forward-char

alias gcc='gcc -Wall'
alias ccat='highlight --ansi --force '
alias pt='clear && nosetests --rednose'
alias vi='vim -p'
alias vim='vim -p'
alias -g R='*(om[1])'
alias ldr="dropbox puburl ~/Dropbox/Public/*(.om[1])"
#alias -g R='"`ls -c | head -1`"
#alias ldr="dropbox puburl ~/Dropbox/Public/`ls -r ~/Dropbox/Public/ | head -1`"
unsetopt share_history
alias cn="smplayer 'mmsh://72.13.93.186/cartoonclassics?.wma&MSWMExt=.asf'"
alias cne="smplayer 'mms://72.13.93.186/campcartoon'"
alias tvpinfo="smplayer 'mmsh://195.245.213.197/Ch0014?MSWMExt=.asf'"
alias bi='bundle install --binstubs=./bundler_stubs'


[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # This loads RVM into a shell session.
cd .
