# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

source ~/.rvm/scripts/rvm

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# Instalacao das Funcoes ZZ (www.funcoeszz.net)
export ZZOFF=""  # desligue funcoes indesejadas
export ZZPATH="/home/danilo/funcoeszz/funcoeszz"  # script

export ZZDIR="/home/danilo/funcoeszz/zz"
source "$ZZPATH"
# Define a few Colours
BLACK='\e[0;30m'
BLUE='\e[0;34m'
GREEN='\e[0;32m'
CYAN='\e[0;36m'
RED='\e[0;31m'
PURPLE='\e[0;35m'
BROWN='\e[0;33m'
LIGHTGRAY='\e[0;37m'
DARKGRAY='\e[1;30m'
LIGHTBLUE='\e[1;34m'
LIGHTGREEN='\e[1;32m'
LIGHTCYAN='\e[1;36m'
LIGHTRED='\e[1;31m'
LIGHTPURPLE='\e[1;35m'
YELLOW='\e[1;33m'
WHITE='\e[1;37m'
NC='\e[0m' # No Color

#tmux="tmux -2 -f ~/.tmux.conf"
#tmux="tmux -2 -f ~/.tmux.conf"

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

export color_prompt=yes

if [ "$color_prompt" = yes ]; then
  PS1='${debian_chroot:+($debian_chroot)}\[\033[01;36m\]\u@\h\[\033[00m\]:\[\033[01;36m\]\w \[\033[00m\] \[\033[01;31m\]$(parse_ruby_version) \[\033[01;31m\]$(parse_git_branch) \[\033[00m\] \n\[\033[01;35m\]$ \[\033[00m\]'
else
  PS1='${debian_chroot:+($debian_chroot)}\[\033[01;36m\]\u@\h\[\033[00m\]:\[\033[01;36m\]\w \[\033[00m\] \[\033[01;31m\]$(parse_git_branch) \[\033[00m\] \n\[\033[01;35m\]$ \[\033[00m\]'
fi

unset color_prompt force_color_prompt

# git branch
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1) /'
}

parse_ruby_version() {
    rbv=`rvm-prompt`
    rbv=${rbv#ruby-}
    [[ $rbv == *"@"* ]] || rbv="${rbv}@default"
    echo $rbv
}

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    eval "`dircolors -b`"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alhF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

alias wimdu='cd ~/projects/wimdu'
alias vssh='vagrant ssh default'
alias all_tests='bundle exec rake spec:all ; bundle exec rake jasmine:run_headless ; bundle exec cucumber -t ~@pending'

alias dc='docker-compose'
alias dcu='docker-compose up -d'
alias dcs='docker-compose stop'
alias dcr='docker-compose restart'
alias dcb='docker-compose build'
alias pulp='cd ~/projects/integration/integrations-infrastructure/pulp/'
alias d='cd ~/projects/bloomy_projects/bloomydays/'

#environment variables for mongodb
export JAVA_HOME=/opt/jdk1.7.0_03/bin/

export EDITOR=vim
export NLS_LANG="AMERICAN_AMERICA.WE8ISO8859P9"

##################
# WELCOME SCREEN #
##################

#source ~/funcoeszz
clear
#toilet -f mono9 -F metal Bem vindo!
echo -ne "${LIGHTBLUE}Hello, $USER. today is, "; date
echo -ne "${YELLOW}"
#cow=$(ls /usr/share/cowsay/cows/ | shuf | head -n1)
fortune | cowsay -f tux
#zzramones | cowsay -f tux
echo -ne "${NC}"

alias ack="ack-grep"
alias r.="cd ..; cd -"
r.
alias gst="git status"
export TERM="xterm-256color"
alias tenspec="for i in {1..10}; do rspec ; done"

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

export HISTCONTROL=ignoredups:erasedups  # no duplicate entries
export HISTSIZE=100000                   # big big history
export HISTFILESIZE=100000               # big big history
shopt -s histappend                      # append to history, don't overwrite it

alias ducks='du -cksh * | sort -rn | head'
export REDIS_PATH="/usr/bin/redis-server"
export RABBITMQ_URL="amqp://localhost:5672"
export MONGODB_URL="mongodb://localhost:27017/"
export PORT="3001"
#export DOCKER_HOST="unix:///var/run/docker.sock"
