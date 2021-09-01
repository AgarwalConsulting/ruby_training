# a = ["Gaurav", "Dheeraj", "Jagadeesh", "Jeremy"]

# # a.each do |name|
# #   puts name
# # end

# a.each { |name| puts name }

# ---

# another_arr = [1, 2, 3, 5, 7]

# pp another_arr.map {|el| el * 2 }

# ---

numbers = 1..100

pp numbers.filter { |el| el % 2 == 0 }
