#!/bin/sh

export JULIA_DEPOT_PATH="/workspaces/julia-genie-poc/local_depot"

julia -e 'using Pkg;
    Pkg.add("PackageCompiler")
    using PackageCompiler;
    Pkg.activate("mana";shared=true);
    println(">>> DEVELOP <<<");
    Pkg.develop(path="/workspaces/julia-genie-poc/JuliaGeniePoc");
    Pkg.develop(path="/home/genie/app/GenieMaRuntime")exit

    println(">>> INSTANTIATE <<<");
    Pkg.instantiate();
    println(">>> UPDATE <<<");
    Pkg.update();
    println(">>> PRECOMPILE <<<");
    Pkg.precompile();'


# create_app("./GenieMaRuntime", "./GenieMaRuntimeCompiled", force=true)

./JuliaGeniePoc/bin/server
