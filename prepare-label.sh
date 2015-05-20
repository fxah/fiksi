#!/bin/bash

# This theme ignores categories altogether and only use tags which are
# called 'label' pulled from your front matter. This script create a
# template for listing posts under a label.

cd -P "$(dirname "${BASH_SOURCE[0]}")"
[ ! -d ./label ] && mkdir ./label

_usage()
{
	echo "Usage: $0 <label1> ..."
	exit $1
}

[ -z "$1" ] && _usage 1
[ "$1" = -h ] && _usage 0

_make_label()
{
	FL=./label/"$1".md
	cat > "$FL" <<EOD
---
layout: label
tag: $1
permalink: /label/$1/
---
EOD

}

while [ -n "$1" ]; do
	_make_label "$1"
	shift
done

exit 0

