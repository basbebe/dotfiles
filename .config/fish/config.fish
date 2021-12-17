
# .           .       .
# |-. ,-. ,-. |-. ,-. |-. ,-.
# | | ,-| `-. | | |-' | | |-'
# ^-' `-^ `-' ^-' `-' ^-' `-'
#

# PATH
fish_add_path --global --path --move /usr/local/sbin
fish_add_path --global --path --move /usr/local/bin
fish_add_path --global --path --move ~/.local/bin

# Rust
fish_add_path --global --path --append ~/.cargo/bin

# clangd
fish_add_path --global --path --append /usr/local/opt/llvm/bin/

# util-linux
fish_add_path --global --path --append /usr/local/opt/util-linux/bin
fish_add_path --global --path --append /usr/local/opt/util-linux/sbin

if status is-interactive

    # Settings  ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––

    # remove greeting
    set fish_greeting

    # Program-specific –––––––––––––––––––––––––––––––––––––––––––––––––––––––––

    # bat
    abbr cat bat
    set -x BAT_THEME gruvbox-{$OS_THEME}
    set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"

    # fzf
    # this is already being set by PatrickF1/fzf.fish
    # set -x FZF_DEFAULT_OPTS '--multi --layout=reverse --border --height=90% --preview-window=wrap --marker="*"'
    bind --erase \cf
    bind \ef __fzf_search_current_dir

    # Java…
    set -x JAVA_HOME (/usr/libexec/java_home)
    fish_add_path --global --path --append $JAVA_HOME/bin

    # kakoune.cr
    set -x EDITOR 'kcr edit'
    set -x VISUAL 'kcr edit'

    # Less
    set -x PAGER 'less -iR'
    set -x LESS '-g -i -M -R -S -w -z-4'
    set -x LESSOPEN "|/usr/local/bin/lesspipe.sh %s"
    set -x LESS_ADVANCED_PREPROCESSOR 1

    # lf
    source ~/.config/lf/icons.fish

    # nnn
    set -x GUI 1
    set -x NNN_OPTS 'acdEFQSUx'
    set -x NNN_OPENER "$HOME/.config/nnn/plugins/nuke"
    set -x NNN_BMS 'd:~/Documents;g:~/git;u:~/;.:~/.config'
    set -x NNN_PLUG 'c:fzcd;f:finder;o:fzopen;O:!launch $nnn*;p:preview-tui;d:diffs;t:nmount;v:imgview;g:-!git diff;l:-!git log;z:!&zathura $nnn*'
    set -x NNN_ARCHIVE "\\.(7z|bz2|gz|tar|tgz|zip)"
    set -x NNN_COLORS '4253'
    set -x NNN_FCOLORS '020b0c0a000d0e0705030509'

    # Aliases & Abbreviations ––––––––––––––––––––––––––––––––––––––––––––––––––

    # abduco
    abbr ssha ssh-abduco

    # btm
    alias btm 'btm --color=gruvbox(test $OS_THEME = dark || echo -light)'

    abbr cx 'chmod -x'

    abbr cp 'cp -i'

    # exa
    alias exa 'exa --icons'
    abbr ll 'exa -l'
    abbr ls exa
    abbr la 'exa -a'
    abbr lla 'exa -la'
    abbr llg 'exa -l --git'
    abbr tree 'exa --tree'

    # git
    abbr gc 'git commit'
    abbr gca 'git commit --all'
    abbr gf 'git fetch --all --prune'
    abbr gfp 'git fetch --all --prune; git pull; git remote update'
    abbr gl 'git log --oneline --graph --decorate --all'
    abbr gp 'git pull'
    abbr gP 'git push'

    # Homebrew
    abbr brews 'brew search'
    abbr brewi 'brew install'
    abbr brewn 'brew info'
    abbr brewu 'brew update'
    abbr brewU 'brew upgrade'

    # kakoune
    abbr kk kittykak

    # kakoune.cr
    abbr k 'kcr edit'
    abbr K 'kcr-fzf-shell'
    abbr KK 'kcr-fzf-shell --working-directory .'
    abbr ks 'kcr shell --session'
    abbr kl 'kcr list'
    abbr a 'kcr attach'
    alias :f 'kcr fzf files'
    alias f: 'kcr-fzf-shell --working-directory . kcr fzf files'
    alias fm: 'kcr-fzf-shell sidetree --working-directory'
    alias :g 'kcr fzf grep'
    alias g: 'kcr-fzf-shell --working-directory . kcr fzf grep'

    # lazygit
    abbr lg lazygit

    abbr mv 'mv -i'

    # use neovim
    abbr vi nvim
    abbr vim nvim

    # use Python3 as default
    abbr python python3

    # Utility / Housekeeping –––––––––––––––––––––––––––––––––––––––––––––––––––

    # SSH via gpg-agent
    set -x GPG_TTY (tty)
    set -x SSH_AUTH_SOCK (gpgconf --list-dirs agent-ssh-socket)

    # get system theme (light/dark mode)
    set -U OS_THEME (defaults read -g AppleInterfaceStyle &> /dev/null && echo dark || echo light)
    fish_update_colors

    # publish fish_private_mode
    if set -q fish_private_mode
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
