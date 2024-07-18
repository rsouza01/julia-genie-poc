(pwd() != @__DIR__) && cd(@__DIR__) # allow starting app from bin/ dir

using JuliaNoGeniePoc
const UserApp = JuliaNoGeniePoc
JuliaNoGeniePoc.main()
