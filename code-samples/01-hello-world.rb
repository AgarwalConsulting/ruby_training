require 'logging'

class Hello
  def initialize
    @logger = Logging.logger(STDOUT)
    super
  end

  def hi
    @logger.info "Using ruby version: " + RUBY_VERSION

    ["Hello, World!", 42].each do |x|
      @logger.warn "#{x} is of type #{x.class}"
    end
  end
end
