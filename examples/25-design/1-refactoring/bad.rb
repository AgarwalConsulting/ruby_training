## Make this:
# * Modular
# * Testable
# * Clean interfaces

data = File.read('data.csv')
rows = data.split("\n").map { |line| line.split(",") }
filtered = rows.select { |r| r[2].to_i > 100 }
filtered.each do |r|
  puts "#{r[0]} has score #{r[2]}"
end
