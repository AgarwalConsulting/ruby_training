class Calculator
  def initialize(strategy)
    @strategy = strategy
  end

  def execute(a, b)
    @strategy.call(a, b)
  end
end

add = ->(a, b) { a + b }
multiply = ->(a, b) { a * b }

puts Calculator.new(add).execute(3, 4)       # => 7
puts Calculator.new(multiply).execute(3, 4)  # => 12
