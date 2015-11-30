# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

# Set to the name theme to load.
# Look in ~/.oh-my-zsh/themes/
export ZSH_THEME="herself"
zstyle ':completion:*' file-sort time

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
#plugins=(vi-mode)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
#export PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:/opt/metasploit:/usr/bin/vendor_perl:/usr/bin/core_perl
bindkey -e

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
#export TERM=xterm-256color

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
alias ack="ack-grep"
#alias -g R='"`ls -c | head -1`"
#alias ldr="dropbox puburl ~/Dropbox/Public/`ls -r ~/Dropbox/Public/ | head -1`"
unsetopt share_history
alias cn="smplayer 'mmsh://72.13.93.186/cartoonclassics?.wma&MSWMExt=.asf'"
alias cne="smplayer 'mms://72.13.93.186/campcartoon'"
alias tvpinfo="smplayer 'mmsh://195.245.213.197/Ch0014?MSWMExt=.asf'"
alias bi='bundle install --binstubs=./bundler_stubs'
alias g='ack-grep'
alias stamp='date +"_%Y_%m_%d_%H%M_barnaba"'
alias o="xdg-open"

[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator
cd .

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
export EDITOR=vim
export DISABLE_AUTO_TITLE=true

if [ $TERM != "screen-256color" ]; then
  export TERM=xterm-256color
fi

# be verbose, i.e. show descriptions
zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format '%U%B%d%b%u'

# group by tag names
zstyle ':completion:*' group-name ''

alias vmore="vim -u ~/.vimrc.more -"
alias mailtar="tar czvvf ~/Desktop/mail/venus`stamp`.tar.gz "

autoload -Uz history-beginning-search-menu
zle -N history-beginning-search-menu
bindkey '^X^X' history-beginning-search-menu
bindkey "^[[1;5A" history-beginning-search-backward
bindkey "^[[1;5B" history-beginning-search-forward
pr(){ kill -HUP `cat /home/barnex/.puppet/var/run/master.pid`; }
alias tf2="mkfifo /tmp/tf2fifo; /bin/bash /home/barnex/.local/share/Steam/SteamApps/common/Team\ Fortress\ 2/hl2.sh -game tf -steam -dxlevel 81 -full -console -novid -useforcedmparms -noforcemaccel -noforcemspd -w 1280 -h 720 < /tmp/tf2fifo| tee /tmp/tf2log | ruby pytania.rb > /tmp/tf2fifo & echo 'alias odp say' "

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
