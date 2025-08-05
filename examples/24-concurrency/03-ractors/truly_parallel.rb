r1 = Ractor.new do
  puts "Ractor 1 started"
  sleep 1
  puts "Ractor 1 done"
end

r2 = Ractor.new do
  puts "Ractor 2 started"
  sleep 1
  puts "Ractor 2 done"
end

[r1, r2].map(&:take)

# This runs in **\~1 second**, not 2 — **true parallelism** unlike threads in MRI.
