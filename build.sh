#!/bin/sh

set -e

rm -f *.build *.buildinfo *.upload *.changes *.dsc *.tar.xz *.tar.gz
cd heaptrace
git pull
rm -f ./heaptrace/debian/heaptrace.doc-base.EX
make dpkg
debuild -S | tee /tmp/debuild.log 2>&1
cd ..
#dput -fd ppa:arinerron/heaptrace "$(ls *.changes)"
