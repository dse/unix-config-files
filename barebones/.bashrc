if which emacs >/dev/null ; then
	export EDITOR='emacs -nw'
	export VISUAL='emacs -nw'
	export FCEDIT='emacs -nw'
fi
if which less >/dev/null ; then
	export PAGER='less'
fi
alias rm='command rm -i'
alias mv='command mv -i'
alias cp='command cp -i'
case "$TERM" in
xterm*|screen*|vt*|linux*)
	_bold_=$'\e''[1m'
	_reset_=$'\e''[m'
	_rev_=$'\e''[7m'
	;;
*)
	_bold_="`tput bold`"
	_reset_="`tput sgr0`"
	_rev_="`tput rev`"
	;;
esac
if [ "$USER" = "root" ] || [ "$LOGNAME" = "root" ] ; then
	PS1='${_rev_}\u@\h \w \$${_reset_} '
else
	PS1='${_bold_}\u@\h \w \$${_reset_} '
fi
