require 'async'

Async do
  puts "Running in fiber"
end

puts "Hello from main!"
