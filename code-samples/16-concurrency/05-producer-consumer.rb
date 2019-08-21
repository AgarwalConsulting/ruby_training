# Credits: https://dev.to/enether/working-with-multithreaded-ruby-part-ii-5e3
require 'thwait'

BUFFER_LIMIT = 2
threads = []
tasks = [] # Buffer limit is 2
mutex = Mutex.new

# producer
2.times do
  threads << Thread.new do
    loop do
      mutex.synchronize do
        if tasks.length < BUFFER_LIMIT
          tasks << "Task :)"
        end
      end
    end
  end
end

# consumer
5.times do
  threads << Thread.new do
    loop do
      task = nil
      mutex.synchronize do
        if tasks.length != 0
          task = tasks.shift
        end
      end
      unless task.nil?
        puts "Doing busy work!"
      else
        puts "Wasted cycle!"
      end
    end
  end
end

ThWait.all_waits(threads)
