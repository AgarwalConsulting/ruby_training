# Object space exercises

## 🧪 Exercise 1: Count Objects by Class

**Goal:** Use `ObjectSpace.each_object` to count how many live objects of a certain class exist.

```ruby
puts "Live String objects: #{ObjectSpace.each_object(String).count}"
puts "Live Array objects: #{ObjectSpace.each_object(Array).count}"
```

Try creating a few strings/arrays and re-running this. What do you notice?

---

## 🧪 Exercise 2: Shallow Object Size

**Goal:** Use `ObjectSpace.memsize_of` to check object sizes.

```ruby
require 'objspace'

s1 = "a"
s2 = "a" * 1000

puts "Small string size: #{ObjectSpace.memsize_of(s1)}"
puts "Large string size: #{ObjectSpace.memsize_of(s2)}"
```

---

## 🧪 Exercise 3: View Total Heap Summary

**Goal:** Use `ObjectSpace.count_objects` to get overall stats.

```ruby
pp ObjectSpace.count_objects
```

Observe `:TOTAL`, `:FREE`, `:T_STRING`, etc.

---

## 🧪 Exercise 4: Object Identity & Lifecycle

**Goal:** Track whether an object survives after its variable goes out of scope.

```ruby
def make_string
  str = "I might live"
  puts "Inside method: #{ObjectSpace.each_object(String).count}"
end

make_string
GC.start

puts "After GC: #{ObjectSpace.each_object(String).count}"
```

Try freezing the string, or assigning it to a global (`$x = str`) and observe changes.

---

## 🧪 Exercise 5: Trace Object Allocation

**Goal:** See where an object was created from.

```ruby
require 'objspace'

ObjectSpace.trace_object_allocations_start

s = "traced object"
puts ObjectSpace.allocation_sourcefile(s)
puts ObjectSpace.allocation_sourceline(s)
```

Try defining objects in methods or files and see how this changes.

---

## 🧪 Exercise 6: Freeing Memory

**Goal:** Observe heap changes after removing object references.

```ruby
require 'objspace'

big_array = Array.new(1_000_000) { "data" }
puts "Before GC: #{ObjectSpace.count_objects[:T_STRING]}"

big_array = nil
GC.start

puts "After GC: #{ObjectSpace.count_objects[:T_STRING]}"
```

---

## 🧪 Exercise 7: Watch Object Mutation

**Goal:** See how references affect object mutation.

```ruby
a = "hello"
b = a
b.upcase!

puts "a: #{a}, b: #{b}"  # both are upcased
puts "Same object? #{a.equal?(b)}"
```

Now try duplicating `a = "hello"; b = a.dup` and test again.
