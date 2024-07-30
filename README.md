# julia-genie-poc



## Settings

~~~sh
$ mkdir "/workspaces/local_depot"
$ export JULIA_DEPOT_PATH="/workspaces/local_depot"

$ wget https://julialang-s3.julialang.org/bin/linux/x64/1.10/julia-1.10.4-linux-x86_64.tar.gz
$ tar zxvf julia-1.10.4-linux-x86_64.tar.gz
$ sudo mv julia-1.10.4 /usr/local/
$ sudo ln -s /usr/local/julia-1.10.4/bin/julia /usr/local/bin/julia
$ export PATH=$PATH:/usr/local/julia-1.10.4/bin
~~~


In REPL
~~~julia
pkg> activate --shared <sharedenv>
pkg> add Genie [list of dependencies...]
~~~


## References

### Environments

- https://pkgdocs.julialang.org/v1/environments/
- https://docs.julialang.org/en/v1/stdlib/Pkg/

### Genie

- https://genieframework.github.io/Genie.jl/dev/tutorials/4--Developing_Web_Services.html
- https://www.freecodecamp.org/news/how-to-build-web-apps-in-julia/
- https://genieframework.github.io/Genie.jl/dev/tutorials/16--Using_Genie_With_Docker.html#Creating-an-optimized-Genie-sysimage-with-PackageCompiler.jl