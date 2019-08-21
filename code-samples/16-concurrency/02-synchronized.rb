# Credits: https://dev.to/enether/working-with-multithreaded-ruby-part-i-cj3
require 'thwait'

def send_money(amount)
  puts "Sending $#{amount}"
  sleep 1  # Simulate network call sending of money
end

lock = Mutex.new
threads = []
money_is_sent = false

2.times do
  th = Thread.new do
    lock.synchronize {
      unless money_is_sent
        send_money 10
        money_is_sent = true
      end
    }
  end
  threads << th
end

ThWait.all_waits(*threads)
