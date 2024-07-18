(pwd() != @__DIR__) && cd(@__DIR__) # allow starting app from bin/ dir

using JuliaGeniePoc
const UserApp = JuliaGeniePoc
JuliaGeniePoc.main()

function julia_main()::Cint
    JuliaGeniePoc.main()
    return 0
end
