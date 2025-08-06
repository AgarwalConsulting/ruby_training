module Flyable
  def fly; end
end

module Swimmable
  def swim; end
end

class Duck
  include Flyable
  include Swimmable
end

class Penguin
  include Swimmable
end
