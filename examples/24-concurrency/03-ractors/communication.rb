r = Ractor.new do
  x = Ractor.receive
  Ractor.yield x
  # x.count
  sleep 3

  Ractor.yield x[:grades][2]
end

a = ['S', 'S', 'A']
s = {name: "G A", grades: a}

Ractor.make_shareable(s)
# a.freeze3
# s.freeze

r.send s # Type: ?
puts r.take

a[2] = 'S'

p "Grades:", a
puts r.take
