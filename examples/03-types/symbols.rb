s = "some string"

s1 = "some" + " string"

s2 = "some string"

sym = :some
sym1 = :some_str
sym2 = :some_strng
sym3 = :some_string

puts s
puts s1
puts s == s1
puts s === s1

puts sym
puts sym3 == sym
puts sym3 == sym1
puts sym3 == sym2
