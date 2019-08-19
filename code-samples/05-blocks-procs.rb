require 'pp'

array = [1, 2, 3]

double_proc = Proc.new {|val| val * 2 }

new_array = array.map(&double_proc)

pp array
pp new_array
