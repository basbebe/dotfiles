# source: https://github.com/fatih/dotfiles/blob/main/fish/functions/change_background.fish
# change background to the given mode. If mode is missing,
# we try to deduct it from the system settings.

function change_theme --argument-names mode_setting \
    --description="change terminal themes with macOS System dark mode and vice versa"

    set -l mode

    function get_darkmode_state
        set -l mode light # default value
        if set -q DARKMODE
            if test $DARKMODE -eq 1
                set mode dark
            end
        else
            set -l val ( defaults read -g AppleInterfaceStyle 2> /dev/null )
            if test $status -eq 0
                set mode dark
            end
        end
        echo $mode
    end

    function toggle_mode --argument-names mode
        switch $mode
            case light
                osascript -l JavaScript -e "Application('System Events').appearancePreferences.darkMode = false" >/dev/null
                echo light
            case dark
                osascript -l JavaScript -e "Application('System Events').appearancePreferences.darkMode = true" >/dev/null
                echo dark
        end
    end

    switch $mode_setting
        case light
            set mode (toggle_mode light)
        case dark
            set mode (toggle_mode dark)
        case toggle
            set -l state (get_darkmode_state)
            switch $state
                case light
                    set mode (toggle_mode dark)
                case dark
                    set mode (toggle_mode light)
                case *
                    set mode $state
            end
        case '*'
            set mode (get_darkmode_state)
    end

    # kitty theme
    for instance in (ls -1 /tmp/kitty_listen*)
        kitty @ --to unix:{$instance} set-colors -a -c ~/.config/kitty/themes/gruvbox-{$mode}.conf &
    end

    # kakoune theme
    for client in (kak -l)
        echo "colorscheme gruvbox-$mode" | kak -p $client &
    end

    # yabai window manager
    # switch $mode
    #     case light
    #         yabai -m config active_window_border_color 0xff689d6a
    #     case dark
    #         yabai -m config active_window_border_color 0xff689d6a
    # end

    # spacebar theme
    ~/.config/spacebar/change_mode.sh $mode &

    # fish
    # handled by fish_update_colors function
    set -U OS_THEME $mode

end
