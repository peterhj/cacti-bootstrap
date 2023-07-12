#!/bin/sh
set -eu -o pipefail
cacti_bootstrap_commit="$(git show --format='%H'|head -1)"
echo "- cacti-bootstrap: bootstrapping from git submodules at commit ${cacti_bootstrap_commit}..."
git submodule update --init --recursive
make -C futhark install
