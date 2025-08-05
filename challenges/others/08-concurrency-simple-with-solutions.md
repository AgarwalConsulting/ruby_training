# Simple Concurrency Exercises

## 🧵 1. **Threads**

### 🧪 Exercise: Parallel File Downloads

**Goal**: Download multiple files in parallel using threads.

**Steps**:

1. Choose 3-5 URLs for files (small images or text files).
2. Create a thread for each download.
3. Write the contents to disk.
4. Wait for all threads to finish.

```ruby
require 'net/http'
require 'uri'

urls = [
  'https://www.example.com/file1.jpg',
  'https://www.example.com/file2.jpg',
  'https://www.example.com/file3.jpg'
]

threads = urls.map.with_index do |url, i|
  Thread.new do
    uri = URI(url)
    data = Net::HTTP.get(uri)
    File.write("file#{i + 1}.jpg", data)
    puts "Downloaded file#{i + 1}.jpg"
  end
end

threads.each(&:join)
```

---

## 🧵 2. **Shared Data and Race Conditions**

### 🧪 Exercise: Simulate Bank Transactions

**Goal**: Demonstrate race conditions and fix with a mutex.

**Steps**:

1. Start with a shared balance.
2. Create 10 threads that deposit and withdraw.
3. Use a mutex to protect the balance.

```ruby
balance = 100
mutex = Mutex.new

threads = 10.times.map do
  Thread.new do
    10.times do
      mutex.synchronize { balance += 10 }
      mutex.synchronize { balance -= 10 }
    end
  end
end

threads.each(&:join)
puts "Final balance: #{balance}" # Should always be 100
```

Try running it **without the mutex** — you’ll likely see incorrect balances.

---

## 🌀 3. **Fibers**

### 🧪 Exercise: Simple Cooperative Task Scheduler

**Goal**: Manually schedule two tasks that yield control to each other.

```ruby
task1 = Fiber.new do
  3.times do |i|
    puts "Task 1: #{i}"
    Fiber.yield
  end
end

task2 = Fiber.new do
  3.times do |i|
    puts "Task 2: #{i}"
    Fiber.yield
  end
end

3.times do
  task1.resume
  task2.resume
end
```

🧠 **Question**: What happens if one task yields more or fewer times?

---

## ⚛️ 4. **Ractors (Ruby 3.0+)**

### 🧪 Exercise: Parallel Factorials

**Goal**: Calculate factorials in parallel using Ractors.

```ruby
def factorial(n)
  (1..n).reduce(1, :*)
end

r1 = Ractor.new { factorial(10) }
r2 = Ractor.new { factorial(15) }

puts "Factorial of 10: #{r1.take}"
puts "Factorial of 15: #{r2.take}"
```

🔍 Try modifying it to send the number into the Ractor:

```ruby
r = Ractor.new do
  num = Ractor.receive
  Ractor.yield (1..num).reduce(1, :*)
end

r.send(20)
puts r.take
```

---

## ⚡ 5. **async gem (Fiber-based Scheduler)**

### 🧪 Exercise: Concurrent Timers

**Goal**: Use the `async` gem to wait on multiple timeouts concurrently.

```ruby
require 'async'

Async do
  3.times do |i|
    Async do
      puts "Timer #{i + 1} started"
      sleep 1 + i
      puts "Timer #{i + 1} ended"
    end
  end
end
```

To install:

```bash
gem install async
```

---

## 🎯 Optional Challenges

* ✅ Benchmark threads vs fibers for HTTP requests (I/O bound)
* ✅ Use a `Queue` to manage thread-safe task scheduling
* ✅ Build a fiber-based task runner with resume/yield control
* ✅ Use `concurrent-ruby`’s `Promise` and `Future` for parallel math
