function fish_user_key_bindings
  bind \co 'set old_tty (stty -g); stty sane; lfcd; stty $old_tty; commandline -f repaint'
end

fzf_key_bindings
