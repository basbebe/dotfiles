#!/usr/bin/env sh

sketchybar --set "$NAME" label="$(defaults read ~/Library/Preferences/com.apple.HIToolbox.plist AppleSelectedInputSources | command rg -e '"KeyboardLayout Name" = "*([^"]*)"*;' --replace '$1' --only-matching --color never)"
