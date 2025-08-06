# ## 🧠 **Strategy**

# ### ✅ **What it is:**

# Encapsulates a family of behaviors or algorithms that can be **interchanged at runtime**.

# ### 🔧 **Why you need it:**

# To avoid `if/else` or `case` statements scattered throughout the code — and make behavior swappable based on context, mode, or environment.

# ### 🛠️ **Typical uses:**

# * Communication over different protocols (MQTT, UART, HTTP)
# * Pluggable retry, debounce, or backoff logic
# * Output routing (e.g., log to console vs file vs server)

# Encapsulates interchangeable algorithms.

class Context
  def initialize(strategy)
    @strategy = strategy
  end

  def execute(a, b)
    @strategy.call(a, b)
  end
end

add = ->(a, b) { a + b }
sub = ->(a, b) { a - b }

puts Context.new(add).execute(3, 2)  # => 5
puts Context.new(sub).execute(3, 2)  # => 1
