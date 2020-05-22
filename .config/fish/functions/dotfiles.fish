function dotfiles --wraps=git --description='provides git interface to manage dotfiles'
    git --git-dir=/$HOME/.dotfiles/ --work-tree=/$HOME $argv
end

