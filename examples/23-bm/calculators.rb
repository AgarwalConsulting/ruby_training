require 'benchmark/ips'
# require 'benchmark'

class ExpensiveCalculator
  def initialize
    @cache = {}
  end

  def compute(x)
    unless @cache[x].nil?
      return @cache[x]
    end

    if x <= 0
      return 1
    end

    x * self.compute(x-1)
  end
end

ec = ExpensiveCalculator.new

# n = 100_000
# puts Benchmark.measure {
#   n.times { ec.compute(5) }
# }

# No-cache version (less memory)
class StatelessCalculator
  def compute(x)
    (1..x).reduce(:*)
  end
end

sc = StatelessCalculator.new

# n = 100_000
# puts Benchmark.measure {
#   n.times { sc.compute(5) }
# }

Benchmark.ips do |x|
  x.report("expensive") { ec.compute(10) }
  x.report("stateless") { sc.compute(10) }
end
