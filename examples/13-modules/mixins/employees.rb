class Employee
  include Comparable
  attr_accessor :id, :name, :age

  def initialize(id, name, age)
    @id = id
    @name = name
    @age = age
  end

  def <=>(other)
    @id <=> other.id
  end
end


emp1 = Employee.new(1002, "G A")
emp2 = Employee.new(1005, "G W")
emp3 = Employee.new(1001, "K V M")

arr = [emp1, emp2, emp3]

pp arr
pp arr.sort
