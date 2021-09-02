def mapper(arr, op)
  result = []
  for el in arr
    res_el = op.call(el)
    # res_el = op.(el)
    # res_el = op[el]

    result << res_el
  end
  result
end

arr = [1, 3, 5, 7, 9]

increment = Proc.new do |x|
  x+1
end

pp mapper(arr, increment)
