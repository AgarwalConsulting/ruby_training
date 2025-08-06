require 'concurrent-ruby'

future = Concurrent::Future.execute do
  puts "Started execution..."
  puts "completed execution!"

  2
end

puts "Some other activity"

puts future.value # 2
