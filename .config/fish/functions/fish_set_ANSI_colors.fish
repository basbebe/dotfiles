# gruvbox-inspired ANSI settings
function fish_set_ANSI_colors
    set -U fish_color_autosuggestion      brblack
    set -U fish_color_cancel              red -r
    set -U fish_color_command             brmagenta
    set -U fish_color_comment             bryellow --italic
    set -U fish_color_cwd                 green
    set -U fish_color_cwd_root            red
    set -U fish_color_end                 cyan
    set -U fish_color_error               brred
    set -U fish_color_escape              brcyan
    set -U fish_color_history_current     --bold
    set -U fish_color_host                normal
    set -U fish_color_host_remote         brcyan
    set -U fish_color_keyword             magenta --bold --italics
    set -U fish_color_match               --background=brblue
    set -U fish_color_normal              normal
    set -U fish_color_operator            brgreen
    set -U fish_color_param               brblue
    set -U fish_color_quote               yellow
    set -U fish_color_redirection         bryellow
    set -U fish_color_search_match        --background=brblack
    set -U fish_color_selection           white --bold --background=brblack
    set -U fish_color_user                brgreen
    set -U fish_color_valid_path          --underline
    set -U fish_pager_color_background
    set -U fish_pager_color_completion    brwhite
    set -U fish_pager_color_description   bryellow --italics
    set -U fish_pager_color_prefix        normal --dim  --italics
    set -U fish_pager_color_progress      brwhite --background=cyan
    # set -U fish_pager_color_secondary_background
    # set -U fish_pager_color_secondary_completion
    # set -U fish_pager_color_secondary_description brblack
    # set -U fish_pager_color_secondary_prefix
    set -U fish_pager_color_selected_background    --background=brcyan
    set -U fish_pager_color_selected_completion    black --bold --underline
    set -U fish_pager_color_selected_description   black --italics --bold --underline
    set -U fish_pager_color_selected_prefix        black --italics --underline
end

