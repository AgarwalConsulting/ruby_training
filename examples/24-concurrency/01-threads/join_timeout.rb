mutex = Mutex.new

t = Thread.new do
  mutex.synchronize do
    sleep 5
  end
end

unless t.join(1)
  puts "Thread didn't finish in time"
  t.kill # or log warning
end
