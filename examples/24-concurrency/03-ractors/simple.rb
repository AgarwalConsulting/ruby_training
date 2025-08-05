r = Ractor.new do
  msg = Ractor.receive
  Ractor.yield "Received: #{msg}"
end

r.send "Hello Ractor"
puts r.take
