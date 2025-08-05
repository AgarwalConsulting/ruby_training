require 'eventmachine'

EM.run do
  count = 0

  EM.add_periodic_timer(1) do
    puts "Tick #{count += 1}"
    EM.stop if count >= 5
  end
end
