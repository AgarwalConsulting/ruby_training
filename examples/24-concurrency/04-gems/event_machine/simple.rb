require 'eventmachine'

EM.run do
  EM.add_timer(1) { puts "One second passed" }
  EM.add_timer(2) { puts "Two seconds passed"; EM.stop }
end
