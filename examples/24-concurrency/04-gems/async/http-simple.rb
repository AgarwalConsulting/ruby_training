require 'async'
require 'async/scheduler'
require 'net/http'

Fiber.set_scheduler(Async::Scheduler.new)

f = Async do
  puts "Request..."
  res = Net::HTTP.get(URI("https://httpbin.org/delay/1"))
  puts "Done"
  res
end

puts "Some other long processing..."

puts f

puts f.wait # Blocks until the value is ready
