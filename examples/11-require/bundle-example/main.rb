require 'json'
require 'pry'

# depat = {
#   "Cloud" => ["Paul Kerin", "Gaurav Agarwal"],
#   "DBA" => ["Kunal Patel"],
#   "Web" => ["Priyanka Bagul", "Jeremy Bennett"],
# }

# puts JSON.generate(depat)

f = File.open("./data.json")

contents = f.read

data = JSON.parse(contents)

pp data

# binding.pry
