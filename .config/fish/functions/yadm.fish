function yadm --wraps=git --description='provides git interface to manage dotfiles'
    # invoke lazygit TUI if no arguments are given
    if test (count $argv) -eq 0
        lazygit --git-dir=/$HOME/.local/share/yadm/repo.git --work-tree=/$HOME
    else
        /usr/local/bin/yadm $argv
    end
end

