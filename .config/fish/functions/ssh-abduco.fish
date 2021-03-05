function ssh-abduco --wraps=ssh
    # parse sessions from ssh remote
    set sessions (ssh -q $argv -t abduco |  awk '{ if (NR!=1) { sub("\r", "", $NF); print $NF } }' )

    # open new tab, attach to  main session 
    set tab ( kitty @ launch --type=tab ssh $argv -t abduco -A main )

    # attach to other sessions
    for session in $sessions
        if test "$session" != "main"
            kitty @ launch --match=id:$tab --keep-focus --no-response ssh $argv -t abduco -a $session
        end
    end
end
