This is a companion repo to
[cacti](https://github.com/peterhj/cacti),
a library for experimenting with computation graphs
(or computation "spines"), written in
[Rust](https://github.com/rust-lang/rust) and
[Futhark](https://github.com/diku-dk/futhark).

## Bootstrapping and installing from source

This repo vendors git submodules of all Rust dependencies of
`cacti`, as well as our patched branch of the Futhark compiler.
However, please note that Futhark itself depends on many
Haskell packages which we do _not_ vendor, and are instead
downloaded by cabal during bootstrapping.

    git clone 'https://github.com/peterhj/cacti-bootstrap'
    cd cacti-bootstrap
    ./bootstrap.sh
    cd cacti
    make
