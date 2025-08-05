require 'memory_profiler'

a = "hello"

report = MemoryProfiler.report do
  10_000.times { "leaky".dup }

  Thread.new do
    puts "Thread started"
    a = "hi"
  end

  sleep 1

  GC.start

  puts "Reporting ended"
end


sleep 1

report.pretty_print(to_file: 'mem_profile.txt')

puts a
