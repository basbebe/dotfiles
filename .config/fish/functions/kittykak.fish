function kittykak \
    --description='opens a new kitty tab or window with a Kakoune session in a given directory';

    # set -l argv
    # set -l options (fish_opt -s h -l help)
    # set options $options (fish_opt -s n -l name --required-val)
    # set options $options (fish_opt -s t -l tab)
    # set options $options (fish_opt -s w -l window)
    # argparse $options -- $argv
    argparse --exclusive='t,w' 't/tab' 'w/window' 'n/name=' 'h/help' -- $argv

    set -l _funcname $_
    set -l _help "usage: $_funcname <folder> [ -t/--tab | -w/--window ] [ -n/--name <name> ] -h/--help"

    if set -q _flag_h
        printf '%s\n' $_help
        return 0
    end
    
    if test ( count $argv ) -gt 1
        printf '%s' 'too many arguments'
        printf '%s\n' $_help
        return 1
    elif test ( count $argv ) -eq 1
        set folder $argv[1]
        if test -n "$folder" && test ! -d $folder 
            printf '%s' $folder ' is not a folder'
            printf '%s\n' $_help
            return 1
        end
    else
        set folder $PWD
    end

    set -l name $_flag_n
    set -l type 'tab'

    if set -q _flag_t
        set type 'tab'
    else if set -q _flag_w
        set type 'os-window'
        echo 'window'
    end

    if test -z "$name"
        set name ( basename "$folder" )
    end

    echo $folder
    echo $name
    echo $type

    set -l editorcmd "kak -s $name -e 'nc master; t'"

    kitty @ launch \
        --cwd $folder \
        --type $type \
        --tab-title $name \
        --title "editor" \
        /usr/local/bin/fish -C "$editorcmd"

    kitty @ launch \
        --cwd $folder \
        --title 'nnn' \
        /usr/local/bin/fish -C "n $folder"

    kitty @ goto-layout --match title:$name tall

    return 0

end

