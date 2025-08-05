require 'stackprof'

StackProf.run(mode: :object, out: 'stackprof.dump') do
  10_000.times { "something".upcase }
end
