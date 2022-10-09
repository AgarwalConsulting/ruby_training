# Pass by value or reference?

class Sample
  attr_accessor :value

  def initialize
    @value = 0
  end
end

s1 = Sample.new()

puts s1.value

# s2 = s1.clone
s2 = s1

s1.value = 1

puts s2.value
