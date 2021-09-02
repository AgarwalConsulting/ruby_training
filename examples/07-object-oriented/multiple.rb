class Animal
  attr_accessor :legs
end

class Bird
  attr_accessor :wings
end

class Lion < Animal
end

class Ostrich < Animal, Bird
end
