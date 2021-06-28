# Plugins ——————————————————————————————————————————————————————————————————————

# source "~/.config/kak/plugins/kakoune-extra-filetypes/"

# source "~/.config/kak/plugins/kakoune-find/find.kak"

source "~/git/modeline-extras.kak/rc/modeline-extras.kak"
hook global ModuleLoaded modeline-extras %{
    # enable Nerd Font symbols
    set-option global modeline_nerdfont true

    # enable options
    modeline-buffer-position-enable
    modeline-git-branch-enable
    modeline-indent-enable
    modeline-lsp-enable
    # modeline-codepoint-enable

    # Git branch + Filename
    set-option global modelinefmt '{magenta+i}%opt{modeline_git_branch} {bright-blue+u}%val{bufname}{default}'
    # Position
    set-option -add global modelinefmt ' %val{cursor_line}:%val{cursor_char_column} %opt{modeline_buffer_position}{default}'
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

source "~/.config/kak/plugins/kakoune-shellcheck/shellcheck.kak"

source "~/.config/kak/plugins/kakoune-smooth-scroll/smooth-scroll.kak"
set-option global scroll_keys_normal <c-f> <c-d> <c-u> <pageup> <pagedown> ( ) m M <a-semicolon> <percent> n <a-n> N <a-N> u U <a-u> <a-U>
hook global WinCreate [^*].* %{ hook -once window WinDisplay .* smooth-scroll-enable }

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

source "~/.config/kak/plugins/kakoune-text-objects/text-objects.kak"    text-object-map

source "~/.config/kak/plugins/todo.kak/rc/todo.kak"
hook global WinSetOption filetype=markdown %{
    require-module todo
    add-highlighter buffer/ regex '\[ \]' 0:blue
    add-highlighter buffer/ regex '\[x\]' 0:comment
    map buffer normal <ret> ': todo-toggle<ret>' -docstring "toggle checkbox"
}

source "~/.config/kak/plugins/ui.kak/rc/ui.kak"

source "~/.config/kak/plugins/kakoune-vertical-selection/vertical-selection.kak"
