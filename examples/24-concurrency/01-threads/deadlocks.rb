a = Mutex.new
b = Mutex.new

t1 = Thread.new do
  a.synchronize do
    sleep 0.1
    b.synchronize { puts "Thread 1" }
  end
end

t2 = Thread.new do
  b.synchronize do
    sleep 0.1
    a.synchronize { puts "Thread 2" }
  end
end

t3 = Thread.new do
  loop {}
end

[t1, t2].each(&:join) # DEADLOCK

puts "Exiting Main!"
