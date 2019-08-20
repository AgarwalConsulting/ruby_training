require 'pry'
require_relative('./03-person.rb')

class Worker < Person
  @count = 0
end

Worker.new
p Worker.count
p Person.count

binding.pry
