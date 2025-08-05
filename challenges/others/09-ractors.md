# Ruby Ractor Exercises

Each exercise builds on the previous one. These work with **Ruby 3.0+** only.

---

## ✅ **Exercise 1: Hello Ractor**

### Goal:

* Create a Ractor.
* Send it a string message.
* Print the result using `.take`.

```ruby
r = Ractor.new do
  msg = Ractor.receive
  Ractor.yield "Ractor received: #{msg}"
end

r.send("Hello!")
puts r.take  # => Ractor received: Hello!
```

---

## ✅ **Exercise 2: Ractor Ping-Pong**

### Goal:

* Create two Ractors that send and receive messages back and forth.
* Each prints what it received and sends a reply.

```ruby
pong = Ractor.new do
  loop do
    msg = Ractor.receive
    puts "[PONG] Got: #{msg}"
    Ractor.yield "PONG"
  end
end

ping = Ractor.new(pong) do |pong|
  pong.send("PING 1")
  puts "[PING] Got: #{pong.take}"
end

ping.take
```

---

## ✅ **Exercise 3: Parallel Processing with Ractors**

### Goal:

* Use 4 Ractors to square numbers from 1 to 10 in parallel.

```ruby
ractors = 4.times.map do
  Ractor.new do
    loop do
      num = Ractor.receive
      Ractor.yield num * num
    end
  end
end

1.upto(10) do |i|
  r = ractors[i % 4]
  r.send(i)
  puts "Square of #{i} is #{r.take}"
end
```

---

## ✅ **Exercise 4: Data Pipeline (3 Ractors)**

### Goal:

* Build a chain of 3 Ractors:

  * `source` → `filter` → `sink`
* `source` generates numbers.
* `filter` filters even numbers.
* `sink` prints them.

```ruby
sink = Ractor.new do
  loop do
    val = Ractor.receive
    puts "[SINK] Got even number: #{val}"
  end
end

filter = Ractor.new(sink) do |sink|
  loop do
    val = Ractor.receive
    sink.send(val) if val.even?
  end
end

source = Ractor.new(filter) do |filter|
  (1..10).each do |i|
    filter.send(i)
    sleep 0.2
  end
end

# Let pipeline run
sleep 3
```

---

## ✅ **Exercise 5: Ractor Pool (Worker Pattern)**

### Goal:

* Create a Ractor pool of 4 workers.
* Use a master Ractor to distribute work (squares).
* Collect results in order.

🧪 This simulates a parallel CPU task queue.

---

## ✅ **Exercise 6: Shared Object Error**

### Goal:

* Try to send a non-shareable object to a Ractor and catch the error.

```ruby
r = Ractor.new do
  val = Ractor.receive
end

begin
  obj = {foo: 123}
  r.send(obj)
rescue => e
  puts "Error: #{e.class} - #{e.message}" # Expect Ractor::IsolationError
end
```

---

## ✅ **Exercise 7: `move: true` (Transfer Ownership)**

```ruby
r = Ractor.new do
  obj = Ractor.receive
  puts "Received: #{obj}"
end

data = "I’m movable"
r.send(data, move: true)

# data is now unusable
puts data # Raises Ractor::MovedError
```

---

## ✅ **Exercise 8: Ractor-Driven Sensor System**

Simulate:

* Multiple Ractors emitting sensor data (temperature, pressure, etc.)
* A `collector` Ractor gathering and printing them with timestamps

Would you like this written out in full?

---

## 🧠 Bonus Challenges

| Challenge                             | Concepts Practiced       |
| ------------------------------------- | ------------------------ |
| Implement a **Pub/Sub Broker** Ractor | Dynamic fan-out          |
| Design a **Ractor Router**            | Routing by data type     |
| Build a **parallel file hasher**      | CPU-bound batching       |
| Compare Ractors vs Threads (timing)   | Performance benchmarking |
