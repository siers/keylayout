all:
	setxkbmap -I ${HOME}/code/desktop xkbmap-custom -print | \
		xkbcomp -I${HOME}/code/desktop - ${DISPLAY} 2>&1 | \
		grep -Ev 'No symbols defined for|Key <[A-Z0-9]+> not found in|Symbols ignored'
