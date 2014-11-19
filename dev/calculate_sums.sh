#!/bin/bash

function download {
	local release="$1"
	local out=$(mktemp -dp $release)
	perl -n -e '/\[Download\]\((http.*)\)/ && print $1."\n"' \
		"$release/README.md" | wget -nc -P $out -i -
	echo $out
}

dir="$(dirname "$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )")"
for release in $(ls -dR $dir/[0-9]*/*); do
	packages=""
	if [ ! -f "$release/SHA1SUMS" ]; then
		packages=$(download $release)
		(cd $packages && sha1sum * > $release/SHA1SUMS)
	fi
	
	if [ ! -f "$release/SHA256SUMS" ]; then
		[[ -z "$packages" ]] && packages=$(download $release)
		(cd $packages && sha256sum * > $release/SHA256SUMS)
	fi
	[[ -n "$packages" ]] && rm -rf $packages
done

