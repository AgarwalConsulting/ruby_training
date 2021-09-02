def mapper(arr, &block)
  result = []
  for el in arr
    res_el = yield el
    result << res_el
  end
  result
end

arr = [1, 2, 3, 4, 5]

pp mapper(arr) { |el| el + 1 }
