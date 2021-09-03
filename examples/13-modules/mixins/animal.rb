module Talkable
  def speak
    puts @text
  end
end

class Person
  include Talkable

  def initialize
    @text = "Hello"
  end
end

class Dog
  include Talkable

  def initialize
    @text = "Bark"
  end
end


p = Person.new
p.speak

d = Dog.new
d.speak
