require 'timeout'

mutex = Mutex.new

Thread.new do
  puts "Thread started..."
  begin
    Timeout.timeout(2) do
      mutex.synchronize do
        puts "[Thread] Acquired lock, doing long work"
        sleep 10000   # Simulate long work
        puts "[Thread] Done"
      end
    end
  rescue => e
    puts "[Main] Caught: #{e.class}"
  end
end

sleep 1

# Will hang here — mutex is still locked!
puts "[Main] Trying to re-acquire lock"
mutex.synchronize do
  puts "[Main] Got lock again"
end
