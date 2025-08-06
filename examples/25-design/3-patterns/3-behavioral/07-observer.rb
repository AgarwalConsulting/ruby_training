# ## 👀 **Observer**

# ### ✅ **What it is:**

# A one-to-many dependency system: when one object changes, all interested components are notified.

# ### 🔧 **Why you need it:**

# To **decouple** event producers from event consumers — so you don’t hardwire components together.

# ### 🛠️ **Typical uses:**

# * Sensor value changes
# * UI or log updates based on system state
# * Inter-component messaging in embedded systems

# One-to-many dependency so that when one object changes state, all dependents are notified.

require 'observer'

class Blog
  include Observable

  def new_post(post)
    changed
    notify_observers(post)
  end
end

blog = Blog.new
blog.add_observer(->(post) { puts "New post: #{post}" })
blog.new_post("Design Patterns in Ruby")
