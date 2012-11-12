# This is unix-config-files/barebones/.bashrc.
# 
# It is invoked by interactive and non-interactive bash shells.
# These are pretty much my personal preferences.

# prepend ~/bin to $PATH but no duplicates
if [ -d ~/bin ] ; then
	case "$PATH" in
	~/bin:*|*:~/bin|*:~/bin:*);;
	*) PATH=~/bin:"$PATH";;
	esac
fi

if [[ "$-" == *i* ]] ; then	# shell is interactive

	if which emacs >/dev/null 2>/dev/null ; then
		export EDITOR='emacs -nw'
		export VISUAL='emacs -nw'
		export FCEDIT='emacs -nw'
	fi

	if which less >/dev/null 2>/dev/null ; then
		export PAGER='less'
		export LESS='-i'
	fi

	# because i'm a manbaby and hate clobbering :-)
	alias rm='command rm -i'
	alias mv='command mv -i'
	alias cp='command cp -i'

	# slightly fancy prompt
	if which tput >/dev/null 2>/dev/null ; then
		_bold_="`tput bold`"
		_reset_="`tput sgr0`"
		_rev_="`tput rev`"
		_white_="`tput setf 7;tput bold`"
		_redbg_="`tput setb 1`"
	else
		_bold_=$'\e'"[1m"
		_reset_=$'\e'"[m"
		_rev_=$'\e'"[7m"
		_white_=$'\e'"[1;37m"
		_redbg_=$'\e'"[1;41m"
	fi
	if [ "$USER" = "root" ] || [ "$LOGNAME" = "root" ] ; then
		PS1='\[${_reset_}${_white_}\]\u@\h \w \$\[${_reset_}\] '
	else
		PS1='\[${_reset_}${_bold_}\]\u@\h \w \$\[${_reset_}\] '
	fi
fi

