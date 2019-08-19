class Person
  attr_accessor :first_name, :last_name

  def self.create
    p = new
    p.first_name = "Mayank"
    p
  end

  def initialize
    self.first_name = "Gaurav"
    self.last_name = "Agarwal"
  end

  def name
    @first_name + " " + @last_name
  end

  # attr_reader :name
  # # Getter
  # def name
  #   @name
  # end

  # attr_writer :name
  # # Setter
  # def name=(new_name)
  #   @name = new_name
  # end
end
