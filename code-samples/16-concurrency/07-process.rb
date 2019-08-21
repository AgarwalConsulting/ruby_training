pid = Process.fork do
  sleep 100
  puts "Hello, world!"
end

puts "Hello, world from parent process!"
puts pid

# Process.wait
