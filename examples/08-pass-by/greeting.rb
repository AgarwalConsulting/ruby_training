def greeting(name)
  # name = "Hello, " + name
  name[3..4] = "k"
end

name = "World"

greeting(name)

puts name
