class CommandSet
end

commands = {
  greet: ->(name) { "Hello, #{name}!" },
  add: ->(x, y) { x + y }
}

# class CommandSet
#   commands.each do |name, block|
#     define_method(name, &block)
#   end
# end

CommandSet.class_eval do
  commands.each do |name, block|
    define_method(name, &block)
  end
end

c = CommandSet.new
puts c.greet("Ruby")  # => "Hello, Ruby!"
puts c.add(2, 3)       # => 5
