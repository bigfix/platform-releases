#!/bin/bash

function generate {
	local dir="$1"
	local out="$2"
	pandoc -f markdown -t html -B $dir/dev/html/before.html -A $dir/dev/html/after.html -o $out/index.html $out/README.md
}

dir="$(dirname "$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )")"
for release in $(ls -dR $dir/[0-9]*/*); do
	generate $dir $release
done

generate $dir $dir

exit 0
