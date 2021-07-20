#!/bin/sh

case $1 in

  dark)
    spacebar -m config background_color            0xff282828
    spacebar -m config foreground_color            0xffebdbb2
    ;;

  light | *)
    spacebar -m config background_color            0xffebdbb2
    spacebar -m config foreground_color            0xff282828
    ;;
  esac
