function update_packages --description='updates package manager and other utilities'
    set emph_color yellow -i

    # dotfiles
    if type -q dotfiles
        set_color $emph_color
        printf '\n%s\n\n' 'updating dotfiles submodules'
        set_color normal
        # dotfiles pull
        # dotfiles submodule sync --recursive
        dotfiles submodule update --init --recursive
        dotfiles submodule update --recursive --remote
    end

    # Homebrew
    if type -q brew
        set_color $emph_color
        printf '\n%s\n\n' 'updating Homebrew'
        set_color normal
        brew update
        brew upgrade
        brew cleanup

        set_color $emph_color
        printf '\n%s\n\n' 'updating Homebrew casks'
        set_color normal
        brew upgrade --cask 
    end

    # Fish shell
    set_color $emph_color
    printf '\n%s\n\n' 'updating fish shell'
    set_color normal
    fisher update
    fish_update_completions

    # npm
    if type -q npm
        set_color $emph_color
        printf '\n%s\n\n' 'updating npm'
        set_color normal
        npm update -g
    end

    # stack
    if type -q stack
        set_color $emph_color
        printf '\n%s\n\n' 'updating stack'
        set_color normal
        stack update
    end

    # python
    if type -q python3
        set_color $emph_color
        printf '\n%s\n\n' 'updating pip3'
        set_color normal
        pip3 install --upgrade pip
        pip3 install --user --upgrade pip
        pip-review --auto
        pip-review --user --auto
    end

    return 0

end

