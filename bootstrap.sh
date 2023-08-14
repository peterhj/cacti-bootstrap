#!/bin/bash
set -eu -o pipefail
cacti_bootstrap_commit="$(git show --format='%H'|head -1)"

echo "- cacti-bootstrap: Bootstrapping from git submodules at commit ${cacti_bootstrap_commit}..."
set -x
git submodule update --init --recursive
{ set +x;} 2>&-

echo "- cacti-bootstrap: Configuring cacti-futhark (note: this calls 'cabal update')..."
set -x
make -C futhark configure
{ set +x;} 2>&-

echo "- cacti-bootstrap: Building and installing cacti-futhark to cabal bin path..."
set -x
make -C futhark install
{ set +x;} 2>&-

echo "- cacti-bootstrap: Bootstrap complete."
echo "- cacti-bootstrap: Now, you may build cacti for development as follows:"
echo "- cacti-bootstrap:"
echo "- cacti-bootstrap:     cd cacti"
echo "- cacti-bootstrap:     make"
echo "- cacti-bootstrap:"
echo "- cacti-bootstrap: Or, if you would like a release build:"
echo "- cacti-bootstrap:"
echo "- cacti-bootstrap:     cd cacti"
echo "- cacti-bootstrap:     make release"
echo "- cacti-bootstrap:"
