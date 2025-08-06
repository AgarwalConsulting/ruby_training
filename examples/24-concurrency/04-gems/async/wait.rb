require 'async'
require 'async/scheduler'

Fiber.set_scheduler(Async::Scheduler.new)

task = Async do
	rand
end

puts "The number was: #{task.wait}"
