x = 1

pid = Process.fork do
  puts "Hello, world!"
  x = x + 10
  puts "Child Process X: #{x}"
end

puts "Hello, world from parent process!"
puts pid

Process.wait

puts x
