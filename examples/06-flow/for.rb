# companies = {}

# companies["Bell Labs"] = {:lat => 32.12341, :long => 12.1214}
# companies["Google"] = {:lat => 12.12, :long => 53.368}
# companies["MasterCard"] = {:lat => 42.12, :long => 12.12} # Pune

# for key, value in companies
#   puts "#{key} is located at #{value[:lat]}°N #{value[:long]}°E"
# end


# ---

str = "hello😋"

# for byte in "hello😋".bytes
  # puts byte.chr
# end

# for char in "hello😋".grapheme_clusters
#   puts char
# end

for el in 0..(str.length)
  puts str[el]
end
