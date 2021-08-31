a = nil

b = "some string"
# b = nil

c = "Hi!"

# def empty?(str)
#   str.size == 0
# end

if !a.nil?
  puts a.length
else
  puts nil
end

puts a && a.length

puts a || b || c
