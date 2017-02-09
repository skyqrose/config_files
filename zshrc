source /data/config_files/aliases
source /data/config_files/sky_shrc

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory autocd extendedglob nomatch notify
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/$USER/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

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
