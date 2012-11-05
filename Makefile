prefix = $(HOME)
stow_options = --ignore '~' --ignore '\#'
default:
	echo 'make install'
	echo 'make uninstall'
	echo 'make cleanup'
	echo 'make prerequisites'
install:
	bin/stow -t "$(prefix)" $(stow_options) barebones
uninstall:
	bin/stow -D -t "$(prefix)" $(stow_options) barebones
cleanup:
	find "$(prefix)" -type l \
		-lname '*/unix-config-files/barebones/*' \
		-exec rm -v {} \;
