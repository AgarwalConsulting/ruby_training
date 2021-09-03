require 'pry'

class Person # ::new, #name, #name=, #age, #age=
  attr_accessor :first_name, :last_name, :age

  def initialize(name, age)
    self.name = name
    @age = age
  end

  def name
    @first_name + " " + @last_name
  end

  # Setter
  def name=(name)
    unless (String === name) && (name.split(" ").length == 2)
      raise "Name wasn't a string; Or doesn't contain first_name last_name"
    end

    @first_name = name.split.first
    @last_name = name.split.last
  end
end

class Employee < Person
  attr_accessor :title, :department, :project_id

  def initialize(name, age, title, department, project_id)
    super(name, age)
    # @name = name
    # @age = age
    @title = title
    @department = department
    @project_id = project_id
  end

  def name
    "#{self.title} #{super}"
  end
end

class Manager < Employee
end

emp = Employee.new("G A", 30, "Director", "LnD", 1001)

pp emp

binding.pry
