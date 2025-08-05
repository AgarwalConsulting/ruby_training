a = [1, 2, 3, 4, 5] # Instance of Array

p a.sum

# Array.new # Class method

## Eigen class
class << a
  def square
    self.each_with_index do |val, idx|
      self[idx] = val ** 2
    end
  end
end

p a.square #

p a.square #

# b = a.dup
# b = a.clone

p b.square
