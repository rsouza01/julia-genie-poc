#!/bin/sh

clear

set -e

VENV=$1
PROJECT=$2
JULIA_DEPOT_PATH=$3

GENIE_ENV="dev"


echo "---------------------------------------------------------"
echo "BUILDING ${PROJECT}"
echo "---------------------------------------------------------"
echo "VENV: ${VENV}"
echo "PROJECT: ${PROJECT}"
echo "JULIA_DEPOT_PATH: ${JULIA_DEPOT_PATH}"
echo "GENIE_ENV: ${GENIE_ENV}"
echo "---------------------------------------------------------"

COMPILED_PROJECT=${PROJECT}-Compiled

rm -rf ./${PROJECT}-Compiled

julia -e "using Pkg;
    Pkg.add(\"PackageCompiler\");
    using PackageCompiler;
    Pkg.activate(\"${VENV}\";shared=true);
    println(\">>> DEVELOP <<<\");
    Pkg.develop(path=\"./${PROJECT}\");
    println(\">>> INSTANTIATE <<<\");
    Pkg.instantiate();
    println(\">>> UPDATE <<<\");
    Pkg.update();
    println(\">>> PRECOMPILE <<<\");
    Pkg.precompile();"

julia --project ./${PROJECT}/make.jl

    # create_app(\"./${PROJECT}\", \"./${COMPILED_PROJECT}\", force=true, filter_stdlibs=true)"

# ./${PROJECT}/bin/_server $VENV

# ./${COMPILED_PROJECT}/bin/${PROJECT}
