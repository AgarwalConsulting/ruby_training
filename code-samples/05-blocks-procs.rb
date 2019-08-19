require 'pp'
require 'pry'

double_proc = Proc.new {|val| val * 2 }

array = [1, 2, 3]
pp array

new_array = array.map {|val| val * 2}

pp new_array

class Student
  attr_accessor :name, :score

  def get_score
    @score
  end

  def update(&block)
    # binding.pry
    @name = "Student from class A - #{@name}"
    update_score &block
  end

  def update_score(&block)
    binding.pry

    if block
      @score = block.call(@score)
    else
      @score = @score + 1
    end
  end

  # def update_score
  #   if block_given?
  #     @score = yield @score
  #   else
  #     @score = @score + 1
  #   end
  # end
end

s = Student.new
s.name = "G"
s.score = 50

# s.get_score &double_proc

s.update &double_proc
# s.update_score &double_proc

pp s
