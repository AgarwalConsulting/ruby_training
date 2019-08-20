class Array
  def to_s
    puts s.value
    join(", ")
  end

  def double
    self.map {|val| val * 2}
  end
end
