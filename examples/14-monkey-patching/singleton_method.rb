a = [1, 2, 3, 4, 5] # Instance of Array

p a.sum

# Array.new # Class method

def a.square
  self.each_with_index do |val, idx|
    self[idx] = val ** 2
  end
end

p a.square #

b = [4, 5, 6]

p b.square
