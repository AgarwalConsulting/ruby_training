a = [1, 2, 3, 4, 5] # Instance of Array

p a.sum

# Array.new # Class method

module Square
  def square()
    self.each_with_index do |val, idx|
      self[idx] = val ** 2
    end
  end

end

## Monkey Patching
class Array
  # def self.square
  # end
  include Square
end

p a.square #

b = [4, 5, 6]

p b.square
