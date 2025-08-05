r3 = Ractor.new do
  msg = Ractor.receive
  puts "R3 got: #{msg}"
end

r2 = Ractor.new(r3) do |r3|
  msg = Ractor.receive
  r3.send("R2 processed: #{msg}")
end

r1 = Ractor.new(r2) do |r2|
  r2.send("Hello from R1")
end

# Wait for everything to finish
[r1, r2, r3].each(&:take)
