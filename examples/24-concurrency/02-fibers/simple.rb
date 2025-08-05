f1 = Fiber.new do
  puts "Fiber 1 - Step 1"
  Fiber.yield
  puts "Fiber 1 - Step 2"
end

f2 = Fiber.new do
  puts "Fiber 2 - Step 1"
  Fiber.yield
  puts "Fiber 2 - Step 2"
end

f1.resume
f2.resume
f1.resume
f2.resume
