require 'objspace'

# def report_counts
#   GC.start
#   counts = Hash.new(0)
#   %w[String Array Hash Proc].each do |klass|
#     counts[klass] = ObjectSpace.each_object(Object.const_get(klass)).count
#   end
#   puts "#{Time.now}: #{counts.inspect}"
# end

# loop do
#   report_counts
#   sleep 60
# end

ObjectSpace.trace_object_allocations_start
# ...
GC.start
ObjectSpace.dump_all(output: File.open("heap.json", "w"))

# Use [`heapviz`](https://github.com/tmm1/heapviz) or process in Python/JQ.
