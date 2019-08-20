require 'pp'

def call_proc
  puts "Before proc"
  value = 2
  # double = Proc.new { |x| x * value }
  # double = Proc.new { |x| return x * value }
  double = lambda { |x| return x * value }
  puts double.call(5)
  puts "After proc"
end

puts "Call Proc: #{call_proc}"
