# If not running interactively, don't do anything
[[ $- != *i* ]] && return

config_files=~/git/config_files

source $config_files/aliases

#allow autocompletion in sudo/man
complete -cf sudo
complete -cf man

PS1='\n${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# History
# Make .bash_history store more and not store duplicates
export HISTCONTROL=ignoreboth
export HISTSIZE=2500
export HISTFILESIZE=2500
# Append to the history file, don't overwrite it
shopt -s histappend

set -o vi

#export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
