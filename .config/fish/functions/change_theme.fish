function change_theme --argument mode_setting
    # change background to the given mode. If mode is missing,
    # we try to deduct it from the system settings.

    set -l mode light # default value

    if set -q DARKMODE
        if test $DARKMODE -eq 1
            set mode dark
        end
    else
        if test -z $mode_setting
            set -l val ( defaults read -g AppleInterfaceStyle 2> /dev/null )
            if test $status -eq 0
                set mode dark
            end
        else
            switch $mode_setting
                case light
                    osascript -l JavaScript -e "Application('System Events').appearancePreferences.darkMode = false" >/dev/null
                    set mode light
                case dark
                    osascript -l JavaScript -e "Application('System Events').appearancePreferences.darkMode = true" >/dev/null
                    set mode dark
            end
        end
    end

    # kitty theme
    for instance in (ls -1 /tmp/kitty_listen*)
        kitty @ --to unix:{$instance} set-colors -a -c ~/.config/kitty/themes/gruvbox-{$mode}.conf
    end

    # fish theme
    base16-gruvbox-{$mode}-medium

    # kakoune theme
    for client in (kak -l)
        echo "colorscheme gruvbox-$mode" | kak -p $client
    end

    set -U OS_THEME $mode

end
