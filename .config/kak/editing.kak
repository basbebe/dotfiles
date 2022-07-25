# commands —————————————————————————————————————————————————————————————————————

define-command -override disable-autoformat -docstring 'disable auto-format' %{
    unset-option buffer formatcmd
    remove-hooks buffer format
}
define-command -override disable-autolint -docstring 'disable auto-lint' %{
    unset-option buffer lintcmd
    remove-hooks buffer lint
}

# generic hooks ————————————————————————————————————————————————————————————————

hook global BufOpenFile  .* %{ modeline-parse }
hook global BufCreate    .* %{ editorconfig-load }
# hook global BufWritePre  .* %{ try %{ format-buffer } }
hook global BufWritePost .* %{ try %{lint-buffer} }

# Enable automatic linting
hook global BufWritePost .* %{
    evaluate-commands %sh{
        if [ -n "$kak_opt_lintcmd" ]; then
            echo lint-buffer
        fi
    }
}

# Filetype-specific
# Makefile
hook global WinSetOption filetype=(ini|makefile|latex) %{
    set-option window indentwidth 0
}

# indentwidth 4 Spaces
# https://en.wikipedia.org/wiki/Indentation_(typesetting)#Indentation_in_programming
hook global WinSetOption filetype=(c|fish|fsharp|java|julia|kak|kotlin|perl|php|python|rust)  %{
    set-indent window 4
}

# Linting & Formatting —————————————————————————————————————————————————————————

hook global WinSetOption filetype=c %{
    set-option window formatcmd 'clang-format -style=file'
}

hook global WinSetOption filetype=fish %{
    set-option window lintcmd 'fish -n'
    set-option window formatcmd 'fish_indent'
}

hook global WinSetOption filetype=haskell %{
    set-option window lintcmd 'hlint'
    set-option window formatcmd 'ormolu'
}

hook global BufSetOption filetype=json %{
    set-option buffer formatcmd "jq --indent %opt{tabstop} ."
}

hook global BufSetOption filetype=(css|javascipt|yaml) %{
    set-option buffer formatcmd "prettier --stdin-filepath=%val{buffile}"
}

hook global BufSetOption filetype=yaml %{
    set-option buffer lintcmd %{ run() {
           # change [message-type] to message-type:
           yamllint -f parsable "$1" | sed 's/ \[\(.*\)\] / \1: /'
      } && run }
}


# handled by lsp
# hook global BufSetOption filetype=(java) %{
    #     set-option buffer formatcmd "prettier --plugin=/usr/local/lib/node_modules/prettier-plugin-java/ --stdin-filepath=%val{buffile}"
# }

hook global BufSetOption filetype=(bash|sh) %{
    set-option buffer formatcmd "shfmt -i 2 -ci -bn -"
    # set-option buffer lintcmd "shellcheck --shell=%opt{filetype}"
}

hook global WinSetOption filetype=python %{
    set-option window lintcmd "flake8 --filename='*' --format='%%(path)s:%%(row)d:%%(col)d: error: %%(text)s' --ignore=E121,E123,E126,E226,E24,E704,W503,W504,E501,E221,E127,E128,E129,F405"
}

hook global BufSetOption filetype=rust %{
    set-option buffer formatcmd 'rustfmt'
}

# text files
hook global BufSetOption filetype=(asciidoc|fountain|latex|markdown|plain) %{
    set-option buffer lintcmd "proselint"
    # (?<=^[-]{3}\n)(.*^)(header-includes:)(?=.*^[-|.]{3}\n)
    set-option buffer formatcmd "pandoc -f %opt{filetype} -t %opt{filetype}-fenced_code_attributes-smart --standalone --reference-links"
}

