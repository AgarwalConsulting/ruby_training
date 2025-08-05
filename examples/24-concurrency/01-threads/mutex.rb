mutex = Mutex.new
counter = 0

threads = 5.times.map do
  Thread.new do
    1000.times do
      mutex.synchronize { counter += 1 }
    end
  end
end

threads.each(&:join)
puts counter # Always 5000
