require 'benchmark/ips'

Benchmark.ips do |x|
  x.report("reverse") { "hello".reverse }
  x.report("upcase")  { "hello".upcase }
  x.compare!
end
