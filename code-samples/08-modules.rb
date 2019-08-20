require 'pry'

module Hello
  def hi
    puts "Hello, World!"
  end
end

class Greeting
  include Hello
end

binding.pry
