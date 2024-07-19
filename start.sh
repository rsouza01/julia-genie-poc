#!/bin/sh

VENV=$1
PROJECT=$2
JULIA_DEPOT_PATH=$3

echo "BUILDING ${PROJECT}"
echo "VENV: ${VENV}"
echo "PROJECT: ${PROJECT}"
echo "JULIA_DEPOT_PATH: ${JULIA_DEPOT_PATH}"

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
    Pkg.precompile();
    create_app(\"./${PROJECT}\", \"./${COMPILED_PROJECT}\", force=true)"

# ./${PROJECT}/bin/_server $VENV

./${COMPILED_PROJECT}/bin/${PROJECT}
