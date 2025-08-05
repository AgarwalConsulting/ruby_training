require 'concurrent-ruby'

future = Concurrent::Future.execute { 1 + 1 }
puts future.value # 2
