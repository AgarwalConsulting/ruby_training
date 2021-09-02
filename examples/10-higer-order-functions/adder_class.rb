class Adder
  def initialize(increment_by)
    @increment_by = increment_by
  end

  def call(x)
    @increment_by + x
  end
end

add_by_2 = Adder.new(2)

puts add_by_2.call(90) # 92
puts add_by_2.call(50) # 52
puts add_by_2.call(10) # 12

add_by_10 = Adder.new(10)

puts add_by_10.call(14) # 24
puts add_by_10.call(24) # 34
puts add_by_10.call(53) # 63
