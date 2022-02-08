# Commands ——————————————————————————————————————————————————————————————————————

# Quick editing
define-command -override -docstring 'Open kakrc' edit-kakoune 'edit ~/.config/kak/kakrc'
define-command -override -docstring 'Open tmux.conf' edit-tmux 'edit ~/.tmux.conf'
define-command -override -docstring 'Open kitty.conf' edit-kitty 'edit ~/.config/kitty/kitty.conf'
define-command -override -docstring 'Open config.fish' edit-fish 'edit ~/.config/fish/config.fish'
define-command -override -docstring 'Open gitconfig' edit-git 'edit ~/.gitconfig'
define-command -override -docstring 'Open broot/conf.toml' edit-broot 'edit ~/.config/broot/conf.hjson'
define-command -override -docstring 'Open starship.toml' edit-starship 'edit ~/.config/starship.toml'
define-command -override -docstring 'Open yabairc' edit-yabai 'edit ~/.config/yabai/yabairc'
define-command -override -docstring 'Open skhdrc' edit-skhd 'edit ~/.config/skhd/skhdrc'
define-command -override -docstring 'Open sketchybarrc' edit-sketchybar 'edit ~/.config/sketchybar/sketchybarrc'
define-command -override -docstring 'Open tridactyl' edit-tridactyl 'edit ~/.config/tridactyl/tridactylrc'

# lazygit
# https://github.com/jesseduffield/lazygit
define-command -override lazygit -params .. -docstring 'Open lazygit' %{
    connect popup lazygit %arg{@}
}

# yadm
define-command -override -docstring 'open yadm with lazygit' yadm 'connect terminal fish -c yadm'

# nnn
define-command -override -docstring 'open nnn window' nnn "connect terminal fish -ic 'nnn -s kak_$KAKOUNE_SESSION'"

# broot
define-command -override -docstring 'open broot window' broot 'connect terminal broot'

# kitty popup
define-command -override -docstring 'kitty-terminal-popup <program> [arguments]: create a new terminal as a kitty overlay' \
    kitty-terminal-popup -params .. -shell-completion %{
        kitty-terminal --type=overlay %arg{@}
}

# kitty split
define-command -override -docstring 'kitty-terminal-popup <program> [arguments]: create a new terminal as a kitty window' \
    kitty-terminal-split -params .. -shell-completion %{
        kitty-terminal --location=hsplit %arg{@}
}

# ide
define-command -override ide %{
    set-option global kitty_window_type window

    rename-client main
    set global jumpclient main

    new rename-client tools
    set global toolsclient tools

    new rename-client lsp
    lsp-auto-hover-enable lsp

    focus main
    set-option global kitty_window_type os-window
}

# Aliases ——————————————————————————————————————————————————————————————————————

# Aliases
alias global ek edit-kakoune

# Buffers
alias global bd delete-buffer

# Git
alias global lg lazygit

# n
alias global n nnn

# br
alias global br broot

# Mappings —————————————————————————————————————————————————————————————————————

# Normal mode ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––

# Arrow keys
map global normal <left> 'h'
map global normal <down> 'j'
map global normal <up> 'k'
map global normal <right> 'l'

# keep normal word movement (overridden by shortcutn.kak)
map global normal w 'w'

# Hot reloading
map -docstring 'reload kakrc' global normal <F5> ':source-kakrc; echo reloaded kakrc<ret>'

# Editing
map -docstring 'save' global normal <c-s> ':write; echo saved<ret>'
map -docstring 'quit' global normal <c-q> ':quit<ret>'

# Tools
map -docstring 'move line down' global normal <c-j> ':move-lines-down<ret>'
map -docstring 'move line up' global normal <c-k> ':move-lines-up<ret>'

# Windowing
map -docstring 'git (popup)' global normal <c-l> ':connect popup fish -ic lazygit<ret>'
map -docstring 'terminal' global normal <c-ret> ':connect terminal fish<ret>'
map -docstring 'file explorer' global normal <c-e> ":nnn<ret>"
map -docstring 'file picker' global normal <c-f> ":connect popup fish -ic 'kcr fzf files'<ret>"
map -docstring 'buffer picker' global normal <c-b> ":connect popup fish -ic 'kcr fzf buffers'<ret>"
map -docstring 'grep picker' global normal <c-g> ":connect popup fish -ic 'kcr fzf grep'<ret>"
map -docstring 'grep picker (buffer)' global normal <c-r> ":connect popup fish -ic 'kcr fzf grep $argv[1]' -- %val{buflist}<ret>"

# case insensitive search by default
map global normal / "/(?i)"

# Commenting
map -docstring 'comment line' global normal <#> ':comment-line<ret>'
map -docstring 'comment block' global normal <a-#> ':comment-block<ret>'

# Move macros to ^
map -docstring 'Play macro' global normal ^ q
map -docstring 'Record macro' global normal <a-^> Q

# Insert mode ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––

map -docstring 'indent' global insert <tab> '<a-;><a-gt>'
map -docstring 'deindent' global insert <s-tab> '<a-;><lt>'

# Minimal set of readline mappings
map -docstring "move the cursor to the start of the line"        global insert <c-a> '<a-;>gh'
map -docstring "move the cursor to the end of the line"          global insert <c-e> '<esc>glli'
map -docstring "delete the character under the anchor"           global insert <c-d> '<a-;>c'
map -docstring "delete from the cursor to the start of the line" global insert <c-u> '<esc>h<a-h>c'
map -docstring "delete from the cursor to the end of the line"   global insert <c-k> '<esc><a-l>c'
map -docstring "delete until the next word boundary"             global insert <a-d> '<esc>ec'
map -docstring "delete until the previous word boundary"         global insert <c-w> '<esc>bc'
map -docstring "paste before the cursor"                         global insert <c-y> '<esc>Pi'

# User mode ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––

# Editing
map -docstring 'write' global user w ': write; echo saved<ret>'
map -docstring 'write quit' global user W ': write-quit;<ret>'
map -docstring 'quit' global user q ': quit<ret>'
map -docstring 'quit!' global user Q ': quit!<ret>'
map -docstring 'delete buffer' global user d ': delete-buffer<ret>'
map -docstring 'delete buffer!' global user D ': delete-buffer!<ret>'

map -docstring 'format selection' global user F ': format<ret>'
map -docstring 'format buffer' global user f ': format-buffer<ret>'
map -docstring "enter Git mode" global user g ": enter-user-mode git<ret>"
map -docstring 'enter LSP mode' global user l ': enter-user-mode lsp<ret>'
map -docstring 'enter kakmerge mode' global user m ': enter-user-mode kakmerge<ret>'
map -docstring 'enter spell mode' global user s ': enter-user-mode spell<ret>'

# edit kakrc
map -docstring 'Open kakrc' global user <,> ': edit-kakoune<ret>'

# commenting
map global user c -docstring '(un-)comment line' ': comment-line<ret>'
map global user C -docstring '(un-)comment block' ': comment-block<ret>'

# pasting from clipboard
map global user -docstring "paste over from system clipboard" R '\| pbpaste<ret>'
map global user -docstring "paste after from clipboard" p '\<a-!> pbpaste<ret>'
map global user -docstring "paste before from clipboard" P '\! pbpaste<ret>'

# git mode
try %{
declare-user-mode git
    map global git -docstring "commit - Record changes to the repository" c ": git commit<ret>"
    map global git -docstring "diff - Show changes between HEAD and working tree" d ": git diff<ret>"
    map global git -docstring "staged - Show staged changes" t ": git diff --staged<ret>"
    map global git -docstring "write - Write and stage the current file" w ": write<ret>: git add<ret>: git update-diff<ret>"
}

# spell checking mode
try %{
declare-user-mode spell
    map global spell d ': set-option current spell_lang de; spell<ret>' -docstring 'German check'
    map global spell e ': set-option current spell_lang en; spell<ret>' -docstring 'Englisch check'
    map global spell n ': spell-next<ret>_: enter-user-mode spell<ret>' -docstring 'next'
    map global spell r ': spell-replace<ret>' -docstring 'replace'
    map global spell a ': spell-add; spell<ret>' -docstring 'add to dictionary'
    map global spell c ': spell-clear<ret>' -docstring 'clear'
    hook global ModeChange push:[^:]*:next-key\[user.spell\] %{
            hook -once -always window NormalIdle .* spell-clear
    }
}

# kakmerge
try %{
    map global kakmerge -docstring "pick local" l ': kakmerge-pick local<ret>'
    map global kakmerge -docstring "pick base" b ': kakmerge-pick base<ret>'
    map global kakmerge -docstring "pick remote" r ': kakmerge-pick remote<ret>'
}

# View mode ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––

