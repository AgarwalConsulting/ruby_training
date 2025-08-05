threads = 5.times.map do |i|
  Thread.new do
    puts "Thread #{i} starting"
    sleep 1
    puts "Thread #{i} done"
  end
end

threads.each(&:join)
