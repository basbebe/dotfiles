
# .           .       .
# |-. ,-. ,-. |-. ,-. |-. ,-.
# | | ,-| `-. | | |-' | | |-'
# ^-' `-^ `-' ^-' `-' ^-' `-'
#

# PATH
set -px PATH /usr/local/sbin $HOME/.local/bin

# Rust
set -ax PATH $HOME/.cargo/bin

# Java…
set -x JAVA_HOME (/usr/libexec/java_home)
set -ax  PATH $JAVA_HOME/bin

# util-linux
set -ax PATH /usr/local/opt/util-linux/bin
set -ax PATH /usr/local/opt/util-linux/sbin

# SSH via gpg-agent
set -x GPG_TTY (tty)
set -x SSH_AUTH_SOCK (gpgconf --list-dirs agent-ssh-socket)
gpgconf --launch gpg-agent

if status is-interactive

    #enable vim key bindings
    # fish_vi_key_bindings

    # Defaults
    if test -z $LANG
        set -x LANG 'de_DE.UTF-8'
    end
    set -x EDITOR kak
    set -x VISUAL kak
    set -x PAGER 'less -iR'

    # Less
    set -x LESS '-g -i -M -R -S -w -z-4'
    set -x LESSOPEN "|/usr/local/bin/lesspipe.sh %s"
    set -x LESS_ADVANCED_PREPROCESSOR 1

    # fzf
    # this is already being set by PatrickF1/fzf.fish
    # set -x FZF_DEFAULT_OPTS '--multi --layout=reverse --border --height=90% --preview-window=wrap --marker="*"'
    bind --erase \cf
    bind \ef __fzf_search_current_dir

    # ues Python3 as default
    abbr python python3
    abbr pip pip3

    # use neovim
    abbr vi nvim
    abbr vim nvim

    # kakoune
    abbr kk kittykak
    
    # exa
    alias exa 'exa --icons'
    abbr ls 'exa'
    abbr ll 'exa -l'
    abbr la 'exa -a'
    abbr lla 'exa -la'
    abbr llg 'exa -l --git'
    abbr tree 'exa --tree'

    # bat
    abbr cat bat
    set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"

    # Homebrew
    abbr brews 'brew search'
    abbr brewi 'brew install'
    abbr brewn 'brew info'
    abbr brewu 'brew update'
    abbr brewU 'brew upgrade'

    # lazygit
    abbr lg lazygit

    # nnn
    # abbr nnn n
    set -x NNN_OPTS 'acDEFx'
    set -x NNN_OPENER "$HOME/.config/nnn/plugins/nuke"
    set -x NNN_BMS 'd:~/Documents;u:~/'
    set -x NNN_PLUG 'c:fzcd;f:finder;o:fzopen;O:-_launch $nnn*;p:preview-tui;d:diffs;t:nmount;v:imgview;g:-_git diff;l:-_git log;z:-_|zathura $nnn*'
    # set -x NNN_FIFO '/tmp/nnn.fifo'
    set -x NNN_ARCHIVE "\\.(7z|bz2|gz|tar|tgz|zip)"
    set -x NNN_COLORS '#6d8ed6af;4235'

    # connect.kak
    if test -n "$IN_KAKOUNE_CONNECT"
        set -x EDITOR :edit
        set -x VISUAL :edit
    end

    # publish fish_private_mode
    if test -n "$fish_private_mode"
        set -x FISH_PRIVATE_MODE $fish_private_mode
    end

    # Starship prompt
    if type -q starship 
        starship init fish | source
    end

    if test "$TERM_PROGRAM" = "iTerm.app"
        # enable iTerm2 tmux integration
        set -x ITERM_ENABLE_SHELL_INTEGRATION_WITH_TMUX YES
        # iTerm2 Shell integration
        source ~/.iterm2_shell_integration.(basename $SHELL)
    end

end

#include local config
if test -e ~/.fish.local
    source ~/.fish.local
end
