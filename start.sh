#!/bin/sh

VENV="mana"

export JULIA_DEPOT_PATH="/workspaces/julia-genie-poc/local_depot"

julia -e "using Pkg;
    Pkg.add("PackageCompiler")
    using PackageCompiler;
    Pkg.activate('${VENV}';shared=true);
    println('>>> DEVELOP <<<');
    Pkg.develop(path='./JuliaGeniePoc');
    println('>>> INSTANTIATE <<<');
    Pkg.instantiate();
    println('>>> UPDATE <<<');
    Pkg.update();
    println('>>> PRECOMPILE <<<');
    Pkg.precompile();
    create_app('./JuliaGeniePoc', './JuliaGeniePocCompiled', force=true)"

# ./JuliaGeniePoc/bin/_server mana
