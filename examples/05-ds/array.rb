def increment arr
  idx = 0
  for el in arr
    if Integer === el
      arr[idx] = el + 1
      idx += 1
    end
  end
  arr
end

arr = [1, 2, 3, 4]

pp arr

pp increment arr

pp arr

arr2 = [2.12, true, "horse"]

pp arr2

pp increment arr2

pp arr2
