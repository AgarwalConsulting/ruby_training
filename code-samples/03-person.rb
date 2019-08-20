class Person
  attr_accessor :first_name, :last_name

  class << self
    attr_accessor :count

    def create
      puts "Count of people: #{@count}"
      p = new
      p.first_name = "Mayank"
      p
    end
  end

  @count = 0 # Initializing a class instance variable

  def initialize
    @first_name = "Gaurav"
    @last_name = "Agarwal"

    self.class.count += 1
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
