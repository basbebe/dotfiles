# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# iterm2 integration
# export ITERM2_SQUELCH_MARK=1
test -e ${HOME}/.iterm2_shell_integration.zsh && source ${HOME}/.iterm2_shell_integration.zsh

# SSH via gpg-agent
export GPG_TTY="$(tty)"
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
gpgconf --launch gpg-agent

# spaceship prompt

# SPACESHIP_CHAR_PREFIX="$(iterm2_prompt_mark) "
# SPACESHIP_VI_MODE_PREFIX="$(iterm2_prompt_mark) "
SPACESHIP_CHAR_SYMBOL_ROOT="#"
SPACESHIP_DIR_TRUNC_PREFIX="…/"
spaceship_vi_mode_enable

#use python3 as default
alias python='python3'
alias pip='pip3'

# neovim
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

# nnn
n ()
{
    # Block nesting of nnn in subshells
    if [ -n $NNNLVL ] && [ "${NNNLVL:-0}" -ge 1 ]; then
        echo "nnn is already running"
        return
    fi

    # The default behaviour is to cd on quit (nnn checks if NNN_TMPFILE is set)
    # To cd on quit only on ^G, remove the "export" as in:
    #     NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"
    # NOTE: NNN_TMPFILE is fixed, should not be modified
    export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"

    # Unmask ^Q (, ^V etc.) (if required, see `stty -a`) to Quit nnn
    # stty start undef
    # stty stop undef
    # stty lwrap undef
    # stty lnext undef

    nnn -Fc "$@"

    if [ -f "$NNN_TMPFILE" ]; then
            . "$NNN_TMPFILE"
            rm -f "$NNN_TMPFILE" > /dev/null
    fi
}
[ -n "$NNNLVL" ] && PS1="N$NNNLVL $PS1"

# manage dotfiles
alias dotfiles='git --git-dir=/$HOME/.dotfiles/ --work-tree=/$HOME'
compdef dotfiles='git'

# conflict between git merge and graphicsmagic
unalias gm

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
