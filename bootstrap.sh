#!/bin/bash
set -e -x

cd
mkdir git
cd git
git clone git@github.com:dse/unix-config-files.git
cd unix-config-files
rm ~/.bashrc
make install
cd
