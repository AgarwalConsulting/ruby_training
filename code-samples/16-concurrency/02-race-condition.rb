# Credits: https://dev.to/enether/working-with-multithreaded-ruby-part-i-cj3
require 'thwait'

def send_money(amount)
  puts "Sending $#{amount}"
  sleep 1 # Simulate network call sending of money PS: This is I/O, so you know Ruby releases GIL here
end

threads = []
money_is_sent = false

2.times do
  th = Thread.new do
    unless money_is_sent
      send_money 10
      money_is_sent = true
    end
  end
  threads << th
end

ThWait.all_waits(*threads)
