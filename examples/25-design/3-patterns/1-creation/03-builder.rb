# Separates construction of a complex object from its representation.

class PizzaBuilder
  def initialize
    @pizza = {}
  end

  def add_cheese
    @pizza[:cheese] = true
    self
  end

  def add_olives
    @pizza[:olives] = true
    self
  end

  def build
    @pizza
  end
end

pizza = PizzaBuilder.new.add_cheese.add_olives.build
