require 'pry'

module Hello
  def hi
    puts "Hello, World!"
  end
end

module Goodbye
  def bye
    puts "Goodbye, World!"
  end
end

class Greeting
  include Hello
  include Goodbye
end

binding.pry
