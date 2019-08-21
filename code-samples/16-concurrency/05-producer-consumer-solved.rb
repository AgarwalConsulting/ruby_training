require 'thwait'

threads = []
tasks = []
mutex = Mutex.new

to_exit = false
times_tasks_added = 0
times_time_wasted = 0
executed_tasks = 0
cv = ConditionVariable.new

# producer
2.times do
  threads << Thread.new do
    loop do
      Thread.kill(Thread.current) if to_exit  # a way to stop execution

      mutex.synchronize do
        if tasks.length < 2
          tasks << "Task :)"
          times_tasks_added += 1
        else
          times_time_wasted += 1
          cv.wait(mutex)  # no need to continue looping in such a case, only continue after it makes sense
        end
      end
    end
  end
end

# consumer
5.times do
  threads << Thread.new do
    loop do
      Thread.kill(Thread.current) if to_exit  # a way to stop execution
      task = nil
      mutex.synchronize do
        if tasks.length != 0
          task = tasks.shift
          cv.signal  # one new task can now be added
        end
      end
      unless task.nil?
        100000.times do
          # Simulating CPU work
          # also doing it outside the mutex so we don't block te tasks array (other producer might want to take a task as well)
        end
        executed_tasks += 1
        if executed_tasks >= 100  # don't loop forever
          to_exit = true
        end
      end
    end
  end
end

ThWait.all_waits(threads)

puts "Total tasks added: #{times_tasks_added}"
puts "Total times we branched out into the useless else statement: #{times_time_wasted}"
