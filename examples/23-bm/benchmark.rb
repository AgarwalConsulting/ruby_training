require 'benchmark'

n = 100_000
puts Benchmark.measure {
  n.times { "hello".reverse }
}
