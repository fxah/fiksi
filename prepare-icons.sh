#!/bin/bash

# This script will generate dummy PNG icons from a set of SVG files. 
# Only run this once after cloning.

cd -P "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"

# check utils
for i in inkscape convert; do
	type $i &>/dev/null
	[ $? -ne 0 ] && echo "ERROR: \`$i\` not found." >&2 && exit 1
done

_confirm_overwrite()
{
	echo "You already have './css/$i' in your system."
	echo -ne "Proceed anyway? [Y/n]: "
	read YN
	[ YN != Y ] && exit 0
}

for i in arrows.png favicon.png icons.png; do
	[ -f ./css/$i ] && _confirm_overwrite $i
done

# icons
for i in ./svg/ico-*.svg; do 
	j=${i%%svg}png
	inkscape --export-png=$j --export-dpi=200 --export-background-opacity=0 \
		--without-gui -w 16 -h 16 $i
done
convert ./svg/ico-*.png -append ./css/icons.png

# favicon, taken from about icon
mv ./svg/ico-01-about.png ./css/favicon.png

# arrows
for i in ./svg/arr-*.svg; do 
	j=${i%%svg}png
	inkscape --export-png=$j --export-dpi=200 --export-background-opacity=0 \
		--without-gui -w 24 -h 24 $i
done
convert ./svg/arr-*.png -append ./css/arrows.png

# cleanup
rm -fr ./svg/*.png

exit 0

