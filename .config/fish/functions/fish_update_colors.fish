# change colors of shell and shell programs when $OS_THEME changes
function fish_update_colors --on-variable OS_THEME
    fish_set_ANSI_colors
    # set -x OS_THEME $OS_THEME
    set -x BAT_THEME gruvbox-{$OS_THEME}
    # echo "theme changed: " $OS_THEME
end
