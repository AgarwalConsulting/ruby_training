# Defining a method name "greeting"
def greeting(name)
  # return "Hello, " + name
  # return "Hello, #{name}"
  "Hello, #{name}"
end

result = greeting("Gaurav")
puts result

result = greeting("MasterCard")
puts result

result = greeting(42)
puts result

result = greeting "Priyanka"
puts result
