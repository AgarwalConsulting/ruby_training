require 'memory_profiler'

array = nil
report = MemoryProfiler.report do
  array = []
  1_000_000.times do
    array << :a_sample_string
    # array << "a sample string"
  end
end

report.pretty_print

# ---

# require 'get_process_mem'

# mem = GetProcessMem.new

# puts "Memory usage before: #{mem.mb} MB."

# array = []
# 1_000_000.times do
#   # array << :a_sample_string
#   array << "a_sample_string"
# end

# mem = GetProcessMem.new

# puts "Memory usage after: #{mem.mb} MB."
