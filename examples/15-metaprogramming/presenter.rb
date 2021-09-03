require 'pry'

class ArrayPresenter
  attr_accessor :value

  def initialize(value)
    @value = value
  end

  def method_missing(m, *args, &block)
    # puts "Method is missing: #{m}"

    value.send(m, *args, &block)
  end

  def respond_to?(m)
    value.respond_to?(m) || super
  end

  # def respond_to_missing?(m, *args)
  #   true
  # end
end

binding.pry

presenter = ArrayPresenter.new([1, 3, 4, 2, 1, 7, 8, 10, 57, 12])

binding.pry
