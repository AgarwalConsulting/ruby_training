class ExpensiveCalculator
  def initialize
    @cache = {}
  end

  def compute(x)
    @cache[x] ||= (1..x).reduce(:*)
  end
end

# No-cache version (less memory)
class StatelessCalculator
  def compute(x)
    (1..x).reduce(:*)
  end
end
