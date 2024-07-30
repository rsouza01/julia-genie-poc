#!/bin/sh

clear

set -e

VENV="mana"
PROJECT="JuliaGeniePoc"
JULIA_DEPOT_PATH="/workspaces/local_depot"

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

julia -e "using Pkg;
    Pkg.add(\"PackageCompiler\");
    using PackageCompiler;
    Pkg.activate(\"${VENV}\";shared=true);
    println(\">>> DEVELOP <<<\");
    Pkg.develop(path=\".\");
    println(\">>> INSTANTIATE <<<\");
    Pkg.instantiate();
    println(\">>> UPDATE <<<\");
    Pkg.update();
    println(\">>> PRECOMPILE <<<\");
    Pkg.precompile();"

julia --project ./compiled/make.jl