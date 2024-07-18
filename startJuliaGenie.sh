#!/bin/sh

VENV="mana"
PROJECT="JuliaGeniePoc"
COMPILED_PROJECT=${PROJECT}-Compiled

JULIA_DEPOT_PATH="/workspaces/julia-genie-poc/local_depot"

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

    # create_app(\"./${PROJECT}\", \"./${COMPILED_PROJECT}\", force=true)"

./${PROJECT}/bin/_server mana

# ./${COMPILED_PROJECT}/bin/${PROJECT}
