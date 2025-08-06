# ### 🔒 Notes:

# * Thread-safe by default.
# * Prevents `new`, `clone`, and `dup`.

require 'singleton'

class AppConfig
  include Singleton

  attr_accessor :env

  def initialize
    @env = 'development'
  end
end

# Usage
config1 = AppConfig.instance
config2 = AppConfig.instance

puts config1.equal?(config2)  # => true
