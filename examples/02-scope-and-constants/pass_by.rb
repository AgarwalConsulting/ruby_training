# def greeting(s)
#   puts s.object_id

#   #
#   # s = "Hello," + s

#   s[0..5] = "Hello"
#   # s[0] = 'J'
#   # s.upcase!
#   # s.upcase
#   puts s.object_id # ?
# end

s = "World"

puts "S: #{s.object_id}"

t = "World"

puts "T: #{t.object_id}" # Different ID

s = "World"

puts "S: #{s.object_id}"

# t = s # Pass by reference

# puts "T: ", t.object_id # ?

# greeting(s)

# # t.upcase!

# puts s # ?
