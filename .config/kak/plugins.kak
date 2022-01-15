# Plugins ——————————————————————————————————————————————————————————————————————

source "~/.config/kak/plugins/active-window.kak/rc/active-window.kak"

source "~/.config/kak/plugins/auto-pairs.kak/rc/auto-pairs.kak"

# symlinked in autoload/
# source "~/.config/kak/plugins/kakoune-extra-filetypes"

source "~/.config/kak/plugins/kakoune-find/find.kak"

source "~/.config/kak/plugins/indent.kak/rc/indent.kak"

source "~/.config/kak/plugins/mark.kak/rc/mark.kak"

source "~/git/modeline-extras.kak/rc/modeline-extras.kak"
hook global ModuleLoaded modeline-extras %{
    # enable Nerd Font symbols
    set-option global modeline_nerdfont true

    # enable options
    modeline-git-branch-enable
    modeline-indent-enable
    modeline-lsp-enable
    # modeline-codepoint-enable

    # Git branch + Filename
    set-option global modelinefmt '{magenta+i}%opt{modeline_git_branch} {bright-blue+u}%val{bufname}{default}'
    # Position
    set-option -add global modelinefmt ' %val{cursor_line}:%val{cursor_char_column} {default}'
    # Context Info + Mode Info
    set-option -add global modelinefmt ' {{context_info}} {{mode_info}}'
    # out-of-view
    # set-option -add global modelinefmt ' {StatusLineMode}%opt{out_of_view_status_line}{default}'
    # lsp
    set-option -add global modelinefmt ' {DiagnosticError}%opt{modeline_lsp_err}{DiagnosticWarning}%opt{modeline_lsp_warn}{default}'
    # Filetype + Indentwidth
    set-option -add global modelinefmt ' %opt{filetype} %opt{modeline_indent}'
    # client@session
    set-option -add global modelinefmt ' {bright-cyan}%val{client}{bright-cyan+b}%val{session}'
}
require-module modeline-extras

source "~/.config/kak/plugins/number-toggle.kak/rc/number-toggle.kak"
require-module number-toggle
set-option global number_toggle_params -hlcursor

source "~/git/pandoc.kak/rc/pandoc.kak"
hook global WinSetOption filetype=(asciidoc|fountain|html|latex|markdown) %{
    require-module pandoc
    set-option global pandoc_options '-d default'
}

source "~/.config/kak/plugins/scrollbar.kak/scrollbar.kak"
hook global WinCreate .* %{ scrollbar-enable }

source "~/.config/kak/plugins/select.kak/rc/select.kak"

source "~/.config/kak/plugins/kakoune-shellcheck/shellcheck.kak"

source "~/.config/kak/plugins/shortcuts.kak/rc/shortcuts.kak"

source "~/.config/kak/plugins/show-whitespaces.kak/rc/show-whitespaces.kak"

source "~/.config/kak/plugins/kakoune-state-save/state-save.kak"    # Starting
hook global KakBegin .* %{
    state-save-reg-load colon
    state-save-reg-load pipe
    state-save-reg-load slash
}

# Quitting
hook global KakEnd .* %{
    state-save-reg-save colon
    state-save-reg-save pipe
    state-save-reg-save slash
}


source "~/.config/kak/plugins/kakoune-sudo-write/sudo-write.kak"

source "~/.config/kak/plugins/surround.kak/rc/surround.kak"

source "~/.config/kak/plugins/kakoune-table/table.kak"
# suggested mappings

# map global user t ": evaluate-commands -draft table-align<ret>" -docstring "align table"

# map global user t ": table-enable<ret>" -docstring "enable table mode"
# map global user T ": table-disable<ret>" -docstring "disable table mode"

# map global user t ": table-toggle<ret>" -docstring "toggle table mode"

map global user t ": enter-user-mode table<ret>" -docstring "table"
map global user T ": enter-user-mode -lock table<ret>" -docstring "table (lock)"

source "~/.config/kak/plugins/kakoune-text-objects/text-objects.kak"

source "~/.config/kak/plugins/tiny.kak/rc/tiny.kak"

source "~/.config/kak/plugins/todo.kak/rc/todo.kak"
hook global WinSetOption filetype=markdown %{
    require-module todo
    add-highlighter buffer/ regex '\[ \]' 0:blue
    add-highlighter buffer/ regex '\[x\]' 0:comment
    map buffer normal <ret> ': todo-toggle<ret>' -docstring "toggle checkbox"
}

source "~/.config/kak/plugins/kakoune-vertical-selection/vertical-selection.kak"

source "~/.config/kak/plugins/window.kak/rc/window.kak"
