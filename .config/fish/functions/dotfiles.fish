function dotfiles --wraps=git --description='provides git interface to manage dotfiles'
    # invoke lazygit TUI if no arguments are given
    if test (count $argv) -eq 0
        lazygit --git-dir=/$HOME/.dotfiles/ --work-tree=/$HOME
    else
        git --git-dir=/$HOME/.dotfiles/ --work-tree=/$HOME $argv
    end
end

