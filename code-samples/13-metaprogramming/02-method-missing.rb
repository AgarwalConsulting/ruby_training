require 'pry'

require 'logging'

class ArrayPresenter
  attr_accessor :value

  @@logger = Logging.logger(STDOUT)

  def initialize(value)
    @value = value
  end

  def method_missing(m, *args, &block)
    @@logger.warn "Method is missing: #{m}"

    value.send(m, *args, &block)
  end

  def respond_to?(m)
    value.respond_to?(m) || super
  end

  # def respond_to_missing?(m, *args)
  #   true
  # end
end

presenter = ArrayPresenter.new([])

binding.pry
