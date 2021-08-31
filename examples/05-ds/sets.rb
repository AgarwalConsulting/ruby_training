require 'set'

arr = [1, 2, 3, "hello", 1, 2]

arr << 6

pp arr
pp arr.length

s = Set[1, 2, 3, "hello", 1, 2]

s << 7
s << "hello"

pp s
pp s.length
