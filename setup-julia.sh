#!/bin/sh

JULIA_VERSION=${JULIA_VERSION}
JULIA_LOCAL_DEPOT="/workspaces/local_depot"

mkdir tmp_julia && cd tmp_julia

wget https://julialang-s3.julialang.org/bin/linux/x64/1.10/julia-${JULIA_VERSION}-linux-x86_64.tar.gz

tar zxvf julia-${JULIA_VERSION}-linux-x86_64.tar.gz
sudo mv julia-${JULIA_VERSION} /usr/local/
sudo ln -s /usr/local/julia-${JULIA_VERSION}/bin/julia /usr/local/bin/julia
export PATH=$PATH:/usr/local/julia-${JULIA_VERSION}/bin

mkdir ${JULIA_LOCAL_DEPOT}
