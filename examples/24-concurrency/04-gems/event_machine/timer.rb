require 'eventmachine'

EM.run do
  puts "Start"

  EM.add_timer(2) do
    puts "2 seconds passed"
    EM.stop
  end

  puts "Event loop running"
end
