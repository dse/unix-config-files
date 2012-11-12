#!/bin/bash
set -e -x

# wget --no-check-certificate -O - https://raw.github.com/dse/unix-config-files/master/bootstrap.sh | bash

cd
[ -d git ] || mkdir git
cd git
[ -d unix-config-files ] || git clone git@github.com:dse/unix-config-files.git
cd unix-config-files
git pull --rebase
rm ~/.bashrc
make install
cd

