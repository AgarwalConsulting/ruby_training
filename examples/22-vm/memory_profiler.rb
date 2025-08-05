require 'memory_profiler'

report = MemoryProfiler.report do
  10_000.times { "leaky".dup }
end

report.pretty_print(to_file: 'mem_profile.txt')
