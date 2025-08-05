def busy
  500_000_000.times { Math.sqrt(12345) }
end

threads = 4.times.map do |i|
  Thread.new {
    puts "Thread #{i} started..."
    busy
    puts "Thread #{i} ended!"
  }
end

threads.each(&:join)
