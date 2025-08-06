# Adds behavior to an object dynamically.

class Coffee
  def cost = 100
end

class MilkDecorator
  def initialize(coffee)
    @coffee = coffee
  end

  def cost
    @coffee.cost + 20
  end
end

puts MilkDecorator.new(Coffee.new).cost  # => 120
