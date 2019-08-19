require 'pp'

h = {"hi" => "Hello", :a => "Apple", 0 => "Zero"}

h.each do |key, value|
  puts "#{key} is #{value}"
end

array = h.map do |key, value| # collect
  value + " 42"
end

pp array

hash = h.reduce(Hash.new) do |initial, (key, value)| # inject
  initial[key] = value * 5
  initial
end

puts hash

pp h.filter {|key, value| key.class == String }
