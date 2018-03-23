#!/usr/bin/env zsh

xset r rate 200 25

if ! grep 'J;WW$.T&T铎z<qDY;!?Y1Mm-}GE}xg-0dR' make &> /dev/null; then
    cd "$(dirname "$0")"
fi

silence() {
    grep -Ev 'No symbols defined for|Key <[A-Z0-9]+> not found in|Symbols ignored'
}

if [ "$1" = "remote" ]; then
    insert="insert remote to detect id"
    id="$(xinput | ruby -npe '$_ = ($_.match(/(?<=id=)\d+/)[0] + "\n" if $_ =~ /HS304.*keyboard/)')"

    if [ -z "$id" ]; then
        echo no kd id detected
    fi

    setxkbmap xkbmap-remote -print | xkbcomp -I$HOME/code/desktop - $DISPLAY -i "$id" 2>&1 | silence
else
    #setxkbmap "xkbmap-custom,xkbmap-math,ru" -print -option grp:rctrl_rshift_toggle -option caps:none |
    setxkbmap "xkbmap-custom,xkbmap-math,ru" -print -option caps:none |
        xkbcomp -I$HOME/code/desktop - $DISPLAY 2>&1 | silence
    xmodmap -e 'keycode 66 = Super_L'
fi
