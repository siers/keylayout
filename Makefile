all:
	setxkbmap -I ${HOME}/code/desktop "xkbmap-custom,xkbmap-math" -print -option grp:shift_caps_toggle | \
		xkbcomp -I${HOME}/code/desktop - ${DISPLAY} 2>&1 | \
		grep -Ev 'No symbols defined for|Key <[A-Z0-9]+> not found in|Symbols ignored'
