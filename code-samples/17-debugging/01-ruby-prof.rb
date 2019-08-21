require 'ruby-prof'

RubyProf.measure_mode = RubyProf::ALLOCATIONS

RubyProf.start

f = File.new("/dev/null", "w")

1_000.times do |i|
  1_000.times do |j|
    i * j
  end
  f.write "i-#{i}"
end

f.close

result = RubyProf.stop

# print a flat profile to text
printer = RubyProf::FlatPrinter.new(result)
printer.print(STDOUT)
