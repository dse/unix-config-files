# This is unix-config-files/barebones/.bashrc.
# 
# It is invoked by interactive and non-interactive bash shells.
# These are pretty much my personal preferences.

if which emacs >/dev/null 2>/dev/null ; then
	export EDITOR='emacs -nw'
	export VISUAL='emacs -nw'
	export FCEDIT='emacs -nw'
fi
if which less >/dev/null 2>/dev/null ; then
	export PAGER='less'
fi
alias rm='command rm -i'
alias mv='command mv -i'
alias cp='command cp -i'

if [[ "$-" == *i* ]] ; then	# shell is interactive
	_bold_="`tput bold`"
	_reset_="`tput sgr0`"
	_rev_="`tput rev`"
	if [ "$USER" = "root" ] || [ "$LOGNAME" = "root" ] ; then
		PS1='\[${_rev_}\]\u@\h \w \$\[${_reset_}\] '
	else
		PS1='\[${_bold_}\]\u@\h \w \$\[${_reset_}\] '
	fi
fi

