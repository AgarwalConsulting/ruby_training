def summer
  sum = 0

  Proc.new do |x| # x = 20; sum = 10
    sum += x # sum is being captured; property of closures
    sum
  end
end

sum_proc_1 = summer

pp sum_proc_1

puts sum_proc_1.call(10) # 10
puts sum_proc_1.call(20) # 30
puts sum_proc_1.call(30) # 60

sum_proc_2 = summer

puts sum_proc_2.call(12) # 12
