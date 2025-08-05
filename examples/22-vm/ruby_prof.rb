require 'ruby-prof'

RubyProf.measure_mode = RubyProf::ALLOCATIONS

RubyProf.start
100_000.times { "something".downcase }
result = RubyProf.stop

printer = RubyProf::FlatPrinter.new(result)
printer.print(STDOUT)
