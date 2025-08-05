# Mutability exercises

## 🔹 Exercise 1: Shallow vs Deep Copy

```ruby
arr = [[1, 2], [3, 4]]
copy = arr.dup
copy[0][0] = 99
puts arr.inspect  # What happens?
```

## 🔹 Exercise 2: Freeze & Clone

```ruby
str = "hello".freeze
clone_str = str.clone
dup_str = str.dup

puts clone_str.frozen?  # => ?
puts dup_str.frozen?    # => ?
```

## 🔹 Exercise 3: Singleton method test

```ruby
obj = Object.new
def obj.id; 42; end

obj2 = obj.dup
obj3 = obj.clone

puts obj2.respond_to?(:id)
puts obj3.respond_to?(:id)
```
