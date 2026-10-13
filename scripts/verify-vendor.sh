#!/bin/bash

if grep "^/vendor" .gitignore; then
	echo '"/vendor" directory found in .gitignore. Stopping as this breaks further checks'
	exit 1
fi

set -e

export GO111MODULE=on
rm -rf vendor
go mod vendor
git diff --exit-code
