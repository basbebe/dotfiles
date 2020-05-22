function update_packages --description='updates package manager and other utilities'
    set emph_color yellow -i

    set_color $emph_color
    printf '%s\n\n' 'updating Homebrew'
    set_color normal
    brew update
    brew upgrade
    brew cleanup

    set_color $emph_color
    printf '\n%s\n\n' 'updating Homebrew casks'
    set_color normal
    brew cask upgrade

    set_color $emph_color
    printf '\n%s\n\n' 'updating fish shell'
    set_color normal
    fisher self-update
    fisher
    fish_update_completions

    set_color $emph_color
    printf '\n%s\n\n' 'updating npm'
    set_color normal
    npm update -g

    set_color $emph_color
    printf '\n%s\n\n' 'updating stack'
    set_color normal
    stack update

    set_color $emph_color
    printf '\n%s\n\n' 'updating pip3'
    set_color normal
    pip3 install --upgrade pip

    return 0

end

