prefix = $(HOME)
stow_options = --ignore '~' --ignore '\#'
default:
	echo 'make install'
	echo 'make uninstall'
	echo 'make cleanup'
	echo 'make prerequisites'
install:
	stow -t "$(prefix)" $(stow_options) barebones
uninstall:
	stow -D -t "$(prefix)" $(stow_options) barebones
cleanup:
	find "$(prefix)" -type l \
		-lname '*/unix-config-files/barebones/*' \
		-exec rm -v {} \;
prerequisites:
	if which brew >/dev/null 2>/dev/null ; \
	then brew install stow ; \
	elif which apt-get >/dev/null 2>/dev/null ; \
	then apt-get install stow ; \
	fi
