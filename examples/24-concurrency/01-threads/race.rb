counter = 0

threads = 5.times.map do
  Thread.new { 1000.times { counter += 1 } }
end

threads.each(&:join)
puts counter # NOT always 5000! (Race condition)
