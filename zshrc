source ~/git/config_files/aliases

# Lines configured by zsh-newuser-install
unset HISTFILE
unset HISTSIZE
unset SAVEHIST
setopt appendhistory autocd extendedglob nomatch notify
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '~/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# History
# http://zsh.sourceforge.net/Doc/Release/Functions.html
zsh_command_log=~/.config/zsh_command_log
function log_command() {
  directory=$(pwd | sed -e 's/^\/home\//\~/')
  echo $(date +%y-%m-%d\ %H:%M:%S) "$directory" "$1" >> $zsh_command_log
}
autoload -Uz add-zsh-hook
add-zsh-hook preexec log_command
function histgrep() {
  grep --text $* $zsh_command_log
}


# The prompt
autoload -U colors && colors #enable colors
name_if_privileged='%(!.%F{red}%n%f .)'
num_jobs='%(1j.%F{red}%j %f.)'
dir='%1~ '
pink_on_fail='%(?..%F{magenta})'
time='%T '
punctuation='%F{blue}%#%f '
PROMPT=$'\n'"$name_if_privileged$pink_on_fail$time$num_jobs$pink_on_fail$dir$punctuation"

RPROMPT='%0(?..[%F{yellow}%?%f])' # [$?] on failure

#export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
