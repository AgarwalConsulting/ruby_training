class Pair
  include Enumerable
  include Comparable

  attr_accessor :first, :second

  def initialize(first, second)
    @first = first
    @second = second
  end

  def +(other)
    Pair.new(@first + other.first, @second + other.second)
  end

  def <=>(other)
    @first <=> other.first
  end

  def each(&block)
    # [@first, @second].each &block
    idx = 0
    loop do
      if idx > 1
        break
      end

      if idx == 0
        yield @first
      else
        yield @second
      end
      idx += 1
    end
  end
end

p1 = Pair.new(23, 46)
p2 = Pair.new(12, 4)

puts p1.map {|el| el * 2 }

puts p1 <=> p2

puts (p1 + p2).first
puts (p1 + p2).second

# p.each {|el| puts el}
