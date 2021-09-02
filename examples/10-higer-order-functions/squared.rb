square = Proc.new do |x|
  x**2
end

arr = [1, 3, 5, 7, 9]

# Block
updated = arr.map do |x|
  x ** 2
end

pp updated

# def square(x)
#   x ** 2
# end

puts square.call(2)

puts square.call(10)
