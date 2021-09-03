# f = File.open("/tmp/log.txt", "a")

# f.write "Hello, World"
# # f.puts "Gaurav"
# # f.puts "Tariq"
# # f.puts "Yatskiv"

# f.close()


File.open("/tmp/log.txt", "a") do |f|
  f.puts "Gaurav"
  f.puts "Tariq"
  f.puts "Yatskiv"
end
