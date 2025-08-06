class Add
  def call(a, b); a + b; end
end

class Multiply
  def call(a, b); a * b; end
end

calc = Calculator.new(Add.new)
puts calc.execute(2, 5)  # => 7
