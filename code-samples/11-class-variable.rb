require 'pry'

class Person
  @@count = 1

  def value
    @@count
  end

  def value=(value)
    @@count = value
  end
end

class Worker < Person
end

binding.pry
