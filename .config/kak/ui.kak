# UI
set-option -add global ui_options terminal_status_on_top=yes
set-option -add global ui_options terminal_assistant=none
set-option -add global ui_options terminal_set_title=no

# Color scheme
# set to dark or light depending on environment variable
# Gruvbox theme for Kakoune
# https://github.com/morhetz/gruvbox
try %sh{
    echo "colorscheme gruvbox-$(~/.local/bin/get-system-theme)"
}

# accept file updates
set-option global autoreload yes

# Highlighters
add-highlighter -override global/ column '%opt{autowrap_column}' @SecondaryCursorEol

# Show characters
add-highlighter -override global/show-unicode-2013 regex '–' '0:green+f'
add-highlighter -override global/show-unicode-2014 regex '—' '0:green+bf'
add-highlighter -override global/show-math-symbols regex '[−×]' '0:cyan+f'

# Scroll offset
set-option global scrolloff 4,4

# Clipboard
# synchronize-terminal-clipboard
hook global RegisterModified '"' %{ nop %sh{
    if [ "$TERM" = "xterm-kitty" ]; then
        printf %s "$kak_main_reg_dquote" | kitty +kitten clipboard
    else
        printf %s "$kak_main_reg_dquote" | pbcopy
  fi
}}

# Tools
set-option global makecmd 'make -j 8'
set-option global grepcmd 'rg --column --with-filename'

# Windowing
hook global ModuleLoaded kitty %{
    set-option global kitty_window_type os-window
    alias global terminal kitty-terminal
    alias global popup kitty-terminal-popup
    alias global split kitty-terminal-split
}

# Allow cycling to the next/previous candidate with <tab> and <s-tab> when completing a word
hook global InsertCompletionShow .* %{
        try %{
            execute-keys -draft 'h<a-K>\h<ret>'
        map window insert <tab> <c-n>
        map window insert <s-tab> <c-p>
    }
}
hook global InsertCompletionHide .* %{
    unmap window insert <tab> <c-n>
    unmap window insert <s-tab> <c-p>
}

# LSP ——————————————————————————————————————————————————————————————————————————

try %sh{kak-lsp --kakoune --session "$kak_session"}

hook global WinSetOption filetype=(c|cpp|elm|crystal|css|elm|haskell|html|java|javascript|json|latex|rust|python|go|typescript|svelte|zig|gdscript) %{
    set-option global lsp_auto_highlight_references true
    set-option global lsp_auto_show_code_actions true
    echo -debug "Enabling LSP for %opt{filetype}"
    lsp-enable-window
}
hook global KakEnd .* lsp-exit

set global lsp_cmd "kak-lsp -s %val{session} --config ~/.config/kak-lsp/kak-lsp.toml"

# uncomment to enable debugging
# set global lsp_cmd "kak-lsp -s %val{session} --config ~/.config/kak-lsp/kak-lsp.toml -vvv --log /tmp/kak-lsp.log"
# eval %sh{echo ${kak_opt_lsp_cmd} >> /tmp/kak-lsp.log}

define-command -override lsp-restart -docstring 'restart lsp server' %{ lsp-stop; lsp-start }
map -docstring 'restart lsp' global lsp Q ': lsp-restart<ret>'

set-option global lsp_config %{
    [language.python.settings._]
    pyls.configurationSources = ["flake8"]
}


face global InfoDefault               Information
face global InfoBlock                 Information
face global InfoBlockQuote            Information
face global InfoBullet                Information
face global InfoHeader                Information
face global InfoLink                  Information
face global InfoLinkMono              Information
face global InfoMono                  Information
face global InfoRule                  Information
face global InfoDiagnosticError       Information
face global InfoDiagnosticHint        Information
face global InfoDiagnosticInformation Information
face global InfoDiagnosticWarning     Information
