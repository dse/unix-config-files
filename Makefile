prefix = $(HOME)
default:
	echo 'make install'
	echo 'make uninstall'
	echo 'make cleanup'
	echo 'make prerequisites'
install:
	bin/deploy barebones
uninstall:
	bin/undeploy barebones
cleanup:
	find "$(prefix)" -type l \
		-lname '*/unix-config-files/barebones/*' \
		-exec rm -v {} \;
