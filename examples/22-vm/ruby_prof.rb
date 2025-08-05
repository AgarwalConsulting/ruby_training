require 'ruby-prof'

profile = RubyProf::Profile.new(measure_mode: RubyProf::WALL_TIME)

profile.start
100_000.times { "something".downcase }
result = profile.stop

# printer = RubyProf::FlatPrinter.new(result)
# f = File.open("/tmp/out.prof", 'w+', 0644)
# printer.print(STDOUT)
# printer.print(f)

printer = RubyProf::CallTreePrinter.new(result)
# mkdir -p /tmp/calltree
printer.print(path: "/tmp/calltree")
