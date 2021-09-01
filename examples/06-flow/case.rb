require 'date'

today = Date.today

case today.month
when 1..2
  puts "Fall"
when 3..4
  puts "Spring"
when 5..8
  puts "Summer"
when 9..12
  puts "Winter"
end

# when 8
#   puts "It is the month of August"
# when 9
#   puts "It is the month of September"
