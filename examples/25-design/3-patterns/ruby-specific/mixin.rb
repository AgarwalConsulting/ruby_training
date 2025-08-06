# Common behavior across unrelated classes.

module Loggable
  def log(msg)
    puts "[LOG] #{msg}"
  end
end

class User; include Loggable; end
class Order; include Loggable; end
