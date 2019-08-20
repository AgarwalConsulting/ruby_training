require_relative './array_patch.rb'

existing_arr = [5, 6, 7]

arr = [1, 2, 3]

# class << arr
#   def double
#     self.map {|val| val * 2}
#   end
# end

pp arr.double
pp arr.to_s
pp existing_arr.double

pp arr.method(:double).source_location
