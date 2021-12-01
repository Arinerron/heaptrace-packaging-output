#!/bin/sh

set -e

rm -f *.changes *.xyz
pushd
cd heaptrace
debuild -S | tee /tmp/debuild.log 2>&1
popd
dput ppa:arinerron/heaptrace "$(ls *.changes)"
