#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

test -e ${HOME}/.iterm2_shell_integration.zsh && source ${HOME}/.iterm2_shell_integration.zsh

# vim
alias vim="nvim"
alias vi="nvim"

# exa
alias ls='exa --icons'
alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'
alias tree='ls --tree'

# bat
alias cat='bat'

# manage dotfiles
alias config='/usr/bin/git --git-dir=/$HOME/.dotfiles/ --work-tree=/$HOME'

# conflict between git merge and graphicsmagic
unalias gm

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
