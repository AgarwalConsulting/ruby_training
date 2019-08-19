existing_arr = [5, 6, 7]

# class Array
#   # def to_s
#   #   join(", ")
#   # end

#   def double
#     self.map {|val| val * 2}
#   end
# end

arr = [1, 2, 3]

class << arr
  def double
    self.map {|val| val * 2}
  end
end

pp arr.double
pp existing_arr.double
