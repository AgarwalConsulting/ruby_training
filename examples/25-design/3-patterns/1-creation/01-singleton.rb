# ## 🧍‍♂️ **Singleton**

# ### ✅ **What it is:**

# A way to ensure a class has **only one instance** globally, with controlled access.

# ### 🔧 **Why you need it:**

# When there’s a single, shared resource or authority across your application — and multiple parts of the system need access to it.

# ### 🛠️ **Typical uses:**

# * Configuration settings
# * Logging
# * Shared hardware interfaces (e.g., I2C, SPI, display)

# Ensures a class has only one instance and provides a global point of access.

require 'singleton'

class Logger
  include Singleton

  def log(message)
    puts message
  end
end

# Logger.new

Logger.instance.log("Hello")

p Logger.instance.object_id
p Logger.instance.object_id
