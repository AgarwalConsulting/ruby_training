counter = 0
data = []

mutex = Thread::Mutex.new

def increment(counter, data)
  data << counter + 1
  data
end

threads = 10.times.map do
  Thread.new do
    1000.times do
      mutex.synchronize do # One one threads
        data = increment(counter, data)
        counter = data.count
      end
    end
  end
end

threads.each(&:join)
p counter, data.count, data
