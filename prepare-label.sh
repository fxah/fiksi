#!/bin/bash

cd -P "$(dirname "${BASH_SOURCE[0]}")"

[ -z "$1" ] && exit 1

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

