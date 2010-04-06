#!/bin/bash

set -e

basedir="${0%/*}"

[ -n "$basedir" -a "$basedir" != "." ] && cd "$basedir"

function info { [ -n "$VERBOSE" ] && echo "INFO: $*" || :; }

info "* global"
mkdir -p website/global
./rawdog -d planetsuse/ \
    --output-dir=website/global \
    --xml-site-link=http://planet.opensuse.org/ \
    --write

for lang in en de es pl pt jp; do
    info "* $lang"
    mkdir -p website/"$lang"
    ./rawdog -d planetsuse/ \
        --lang="$lang" \
        --output-dir=website/"$lang" \
        --xml-site-link=http://planet.opensuse.org/"$lang"/ \
        --write
done
