source ~sky/txt/config_files/aliases
source ~sky/txt/config_files/mbta_rc

# Lines configured by zsh-newuser-install
HISTFILE=~/.config/zsh_histfile
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory autocd extendedglob nomatch notify
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
zstyle ':completion:*:*:git:*' script ~/.zsh/__git/git-completion.zsh
# The following lines were added by compinstall
zstyle :compinstall filename '/home/$USER/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# History
# http://zsh.sourceforge.net/Doc/Release/Functions.html
zsh_command_log=~/.config/zsh_command_log
function log_command() {
  directory=$(pwd | sed -e 's/^\/home\//\~/')
  echo $(date +%y/%m/%d\ %H:%M:%S) "$directory" "$1" >> $zsh_command_log
}
autoload -Uz add-zsh-hook
add-zsh-hook preexec log_command
function histgrep() {
  grep $* $zsh_command_log
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

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
