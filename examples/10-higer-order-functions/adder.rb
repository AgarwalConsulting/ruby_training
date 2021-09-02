def adder(increment_by)
  Proc.new do |x|
    x + increment_by
  end
end

add_by_2 = adder(2)

add_by_10 = adder(10)

puts add_by_2.(90)
puts add_by_2.(50)
puts add_by_2.(10)

puts add_by_10.call(14)
puts add_by_10.call(24)
puts add_by_10.call(53)
