a = 10 # One a variable declared globally

def update(a)
  a += 1
  # a = # Another a declared within update

  puts a
end

puts a # 10

puts "-----------------"
update a # 11
puts "-----------------"

puts a # 10
