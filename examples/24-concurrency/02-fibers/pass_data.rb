f1 = Fiber.new do
  puts "Fiber 1 - Step 1"
  3.times do |i|
    Fiber.yield i
  end
  puts "Fiber 1 - Step 2"
end

# sleep 10

x = f1.resume
puts "First Resume: #{x}"

x = f1.resume
p "First Resume:", x
