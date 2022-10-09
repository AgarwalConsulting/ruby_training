# Pass by value or reference?

class Value
  attr_accessor :num

  def initialize
    @num = 0
  end

  def increment
    @num += 1
  end
end

class Sample
  attr_accessor :value

  def initialize
    @value = Value.new()
  end
end

s1 = Sample.new()

puts s1.value.num

# s1.freeze!
# s2 = s1.dup
# s2 = s1.clone

s2 = s1

s1.value.increment

puts s2.value.num
