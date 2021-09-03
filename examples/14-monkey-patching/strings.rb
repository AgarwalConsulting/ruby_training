require 'pry'

class String
  def blank?
    self.strip.empty?
  end

  def to_arr
    res = []
    for el in self.each_char
      res << el
    end

    res
  end
end

# class String
#   def *(other)
#     chars_1 = "hello".to_arr
#     chars_2 = "world".to_arr

#     chars_1.zip(chars_2).reduce("") {|memo, pair| memo + pair.join }
#   end
# end

binding.pry
