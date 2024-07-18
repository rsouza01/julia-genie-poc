module JuliaNoGeniePoc

# using Genie

# const up = Genie.up
# export up

function main()
  # Genie.genie(; context = @__MODULE__)
  println(">>> JuliaNoGeniePoc <<<")
end

function julia_main()::Cint
  main()
  return 0
end

end
