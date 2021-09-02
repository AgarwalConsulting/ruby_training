def reducer(arr, acc, &block)
  for el in arr
    acc = yield acc, el
  end
  acc
end

val = reducer([1, 2, 3, 4, 5], 0) { |acc, el| acc + el }

val = reducer([1, 2, 3, 4, 5], 0) do |acc, el|
  acc + el
end

puts val

puts "-" * 20

def reducer(arr, acc, proc)
  for el in arr
    acc = proc.call acc, el
  end
  acc
end

sum = Proc.new { |acc, el| acc + el }

val = reducer([1, 2, 3, 4, 5], 0, sum)

puts val
