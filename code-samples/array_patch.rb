class Array
  def to_s
    join(", ")
  end

  def double
    self.map {|val| val * 2}
  end
end

# Array.class_eval do
#   def to_s
#     join(", ")
#   end

#   def double
#     self.map {|val| val * 2}
#   end
# end
