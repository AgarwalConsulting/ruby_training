def busy
  500_000_000.times do
    Math.sqrt(12345)
  end
end

ractors = 4.times.map do
  Ractor.new {
    # puts "Thread #{i} started..."
    busy
    # puts "Thread #{i} ended!"
  }
end

ractors.each(&:take)
