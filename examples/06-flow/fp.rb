# a = ["Gaurav", "Dheeraj", "Jagadeesh", "Jeremy"]

# # a.each do |name|
# #   puts name
# # end

# a.each { |name| puts name }

# ---

# another_arr = [1, 2, 3, 5, 7]

# pp another_arr.map {|el| el * 2 }

# ---

# numbers = 1..100

# pp numbers.filter { |el| el % 2 == 0 }

# ---

arr = [1, 2, 3, 5, 7]

pp arr.reduce(0) {|memo, el| memo + el * 2 }

pp arr.reduce({}) {|memo, el| memo[el] = el * 2; memo }
