#!/bin/bash
set -e -x

# wget --no-check-certificate -O - https://raw.github.com/dse/unix-config-files/master/bootstrap.sh | bash

warn () {
	>&2 echo "$@"
}
die () {
	>&2 echo "$@"
	exit 1
}
shove () {
	if [ -L "$1" ] ; then
		fail=1
		warn "$1 exists and is a symbolic link.  Not removing."
	elif [ -f "$1" ] ; then
		mv "$1" "$1.shove"
	fi
}
require () {
	if ! which "$1" >/dev/null 2>/dev/null ; then
		fail=1
		warn "You need to install the '$1' program."
	fi
}

require git
require make
(( $fail )) && exit 1

cd
[ -d git ] || mkdir git
cd git
[ -d unix-config-files ] || git clone git://github.com/dse/unix-config-files.git
cd unix-config-files
git pull --rebase

shove ~/.bashrc
shove ~/.emacs
shove ~/.screenrc
(( $fail )) && exit 1

make install
cd

