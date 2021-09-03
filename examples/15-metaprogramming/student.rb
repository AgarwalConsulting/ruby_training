require 'pry'

require_relative('./person')

class Student < Person
  @count = 0

  attr_accessor :score

  def initialize
    super
    @score = 0
  end
end

stud = Student.new

stud.instance_eval do
  @score = 100

  def full_name
    "I am stud!"
  end
end

Student.class_eval do
  # alias :full_name :name
  def full_name
    name
  end

  def to_s
    return "#{full_name} - #{score}"
  end
end

Student.instance_eval do
  @count = 0

  def size
    @count
  end
  # alias :size :count
end

puts stud.full_name
puts Student.new.full_name

binding.pry
