a = 10 # One a variable declared globally

def update
  a = a+=1 # Another a declared within update

  puts a
end

puts a # 10

puts "-----------------"
update #
puts "-----------------"

puts a #
