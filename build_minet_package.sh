#!/bin/bash
reset

pushd .

# Remove Old versions
rm minet_3.6.0.tar.gz
R CMD REMOVE --library=../install minet

# build new version
R CMD build --no-build-vignettes --no-manual minet

# install in our directory
R CMD INSTALL --library=../install minet_3.6.0.tar.gz

popd
