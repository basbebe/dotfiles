# .           .       .
# |-. ,-. ,-. |-. ,-. |-. ,-.
# | | ,-| `-. | | |-' | | |-'
# ^-' `-^ `-' ^-' `-' ^-' `-'
#


# PATH
set -x PATH /usr/local/bin /usr/local/sbin $HOME/.local/bin $PATH

#include local config
if test -e ~/.local.fish
    source ~/.local.fish


#enable vim key bindings
fish_vi_key_bindings

# Defaults
if test -z $LANG
    set -x LANG 'de_DE.UTF-8'
end
set -x EDITOR nvim
set -x VISUAL nvim
set -x PAGER less

# Less
set -x LESS '-g -i -M -R -S -w -z-4'
set -x LESSOPEN "|/usr/local/bin/lesspipe.sh %s"
set -x LESS_ADVANCED_PREPROCESSOR 1

# ues Python3 as default
abbr python python3
abbr pip pip3

# use neovim
abbr vi nvim
abbr vim nvim

# exa
alias exa 'exa --icons --grid'
abbr ls exa
abbr l 'exa -l'
abbr la 'exa -a'
abbr lla 'exa -la'
abbr tree 'exa --tree'

# bat
abbr cat bat
set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"

# Cask
abbr cask 'brew cask'

# nnn
abbr nnn n
set -x NNN_OPENER "$HOME/.config/nnn/plugins/nuke"
set -x NNN_BMS 'd:~/Documents;u:~/;D:~/Downloads/'
set -x NNN_PLUG 'f:finder;o:fzopen;p:preview-tui;d:diffs;t:nmount;v:imgview;g:-_git diff;l:-_git log;b:-_bat $nnn*;s:-pdfview'
set -x NNN_FIFO '/tmp/nnn.fifo'
set -x NNN_ARCHIVE "\\.(7z|bz2|gz|tar|tgz|zip)"
set -x NNN_COLORS '1234'

# Starship prompt
starship init fish | source

# enable iTerm2 tmux integration
set -x ITERM_ENABLE_SHELL_INTEGRATION_WITH_TMUX YES

# iTerm2 Shell integration
source ~/.iterm2_shell_integration.(basename $SHELL)

