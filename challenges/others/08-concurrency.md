# Exercises on Concurrency

## 📘 Part 1: Parallel HTTP Request Exercises (Same Task, Different Models)

### 🧪 Common Goal

Make 3 parallel HTTP GET requests to `https://httpbin.org/delay/1`, then print response sizes.

---

### ✅ **Exercise 1: Threads**

**Objective**: Use threads to fetch 3 URLs concurrently.

* Use `Thread.new` and `Net::HTTP.get`.
* Join all threads at the end.

---

### ✅ **Exercise 2: Fibers**

**Objective**: Simulate concurrency using `Fiber` (manual yielding not useful for blocking I/O).

* Show how sequential blocking works without async I/O.
* Compare with other models.

---

### ✅ **Exercise 3: EventMachine**

**Objective**: Use EventMachine and `em-http-request` to send 3 concurrent HTTP requests.

* Set up `EM.run` loop.
* Add timer or callback for stopping the loop.

---

### ✅ **Exercise 4: async Gem**

**Objective**: Use structured concurrency via the `async` gem.

* Use `Async do … end`.
* Use `Async::HTTP::Internet` to make requests.

---

### 🧪 Optional Challenge:

* Modify each model to print responses **in order started**, not in order completed.

---

## 📘 Part 2: Concurrent Sensor Data Collector (Threads + Fibers)

### 🧪 Common Goal:

Simulate 3 sensors collecting data concurrently. Each emits data every second. Collect and display output in real-time.

---

### ✅ **Exercise 5: Threads-Only Sensor Collector**

```ruby
sensors = 3.times.map do |i|
  Thread.new do
    loop do
      data = rand(100..999)
      puts "[Sensor #{i}] Data: #{data}"
      sleep 1
    end
  end
end

sleep 5
sensors.each(&:kill)
```

🧠 Modify to:

* Push data to a shared thread-safe queue (`Queue`).
* Have a separate logger thread pull and log.

---

### ✅ **Exercise 6: Threads + Fibers Sensor Collector**

**Goal**: Use a thread per sensor, but run multiple **fiber tasks per sensor** (like signal processing or filtering) inside that thread.

```ruby
require 'fiber'

def sensor_thread(id)
  Thread.new do
    f = Fiber.new do
      loop do
        data = rand(100..999)
        processed = "[Sensor #{id}] Data: #{data * 2}"
        puts processed
        sleep 1
        Fiber.yield
      end
    end

    loop do
      f.resume
    end
  end
end

threads = 3.times.map { |i| sensor_thread(i) }

sleep 5
threads.each(&:kill)
```

🧠 Ideas to extend:

* Add multiple fibers per sensor: one for reading, one for filtering, one for logging.
* Add simulated delays or errors.
* Queue communication between threads and fiber workers.

---

## 🔁 Extension Ideas

| Enhancement                                      | Concept Used           |
| ------------------------------------------------ | ---------------------- |
| Use `Queue` between threads                      | Thread-safe messaging  |
| Add `Mutex`-protected shared state               | Synchronization        |
| Fiber per sensor channel, switching with `yield` | Cooperative control    |
| Async version with HTTP sensor                   | Async I/O, concurrency |

---

## 💡 Bonus:

### 🧪 Exercise 7: Time-Stamped Logger (Threads + Queue)

**Goal**: Use a thread-safe queue and a logger thread to output all sensor logs with timestamps.
