require 'pry' # #include, import

class Person
  attr_accessor :age
  # attr_accessor :first_name, :last_name
  @@count = 0

  def Person.count
    @@count
  end

  def initialize(name, age)
    @@count = (@@count || 0) + 1
    self.name = name
    self.age = age
  end

  # attr_reader :name, :age
  # attr_writer :name, :age
  # # Getter
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

  # def age
  #   @age
  # end

  # def age=(age)
  #   @age = age
  # end
end

p = Person.new("Gaurav Agarwal", 30)

# p.name = "Gaurav Agarwal"

binding.pry # Breakpoint
