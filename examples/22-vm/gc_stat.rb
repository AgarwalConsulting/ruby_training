before = GC.stat[:heap_free_slots]
GC.compact
after = GC.stat[:heap_free_slots]
puts "Free slots before: #{before}, after: #{after}"
