r2 = Ractor.new do
  msg = Ractor.receive
  Ractor.yield "#{msg} processed by r2"
end

r1 = Ractor.new(r2) do |r2|
  msg = Ractor.receive
  r2.send(msg + " passed through r1")
  result = r2.take
  Ractor.yield result
end

r1.send("Hello, ")
puts r1.take  # => "Hello,  passed through r1 processed by r2"
