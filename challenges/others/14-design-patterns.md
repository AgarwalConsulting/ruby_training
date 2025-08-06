# Design Patterns Exercises

## 🔧 **Exercise Set**

### 🧍 Exercise 1: Configuration Access

You need a centralized configuration system:

* It should hold system-wide settings like `mode`, `version`, and `log_level`.
* Only one configuration store should ever exist.
* Components throughout the application must be able to read and update this configuration safely.

> Implement a way to ensure that all parts of the system refer to the same configuration instance.

---

### 🧍 Exercise 2: Logging System

Create a logging utility that:

* Appends messages to a file (`logs.txt`) with timestamps.
* Has multiple log levels: `info`, `warn`, `error`.
* Must be accessible globally.

> Ensure this utility doesn't require passing around references throughout your system.

---

### 🧠 Exercise 3: LED Controller

Build an LED controller for a hardware abstraction layer:

* You must support different output mechanisms:

  * Direct GPIO toggling
  * MQTT-based toggling
  * Console-only simulation
* These output methods should be swappable without modifying the controller’s main logic.

> Add a mechanism to change how the LED toggles depending on the environment.

---

### 🧠 Exercise 4: Retry Behavior

Write a retry mechanism for failed network calls:

* Allow different retry delay behaviors:

  * Fixed interval (e.g., 1s)
  * Increasing delay (e.g., 1s, 2s, 4s)
  * A predefined sequence (e.g., Fibonacci)
* The retry logic should be reusable across different parts of the system.

> Implement a flexible way to change the delay logic without touching the retry system.

---

### 👀 Exercise 5: Temperature Monitor

Simulate a temperature sensor that periodically updates:

* When the temperature exceeds a threshold, alert an alarm system.
* When the temperature drops too low, alert a heater system.
* Other systems (e.g., logger or dashboard) should also be able to respond to temperature changes.

> Allow other parts of your system to react automatically when the temperature changes.

---

### 👀 Exercise 6: User Input Notification

Write a text input handler:

* When input is received, multiple components must be notified:

  * One logs the input
  * One updates a display
  * One checks for special commands like `exit` or `reboot`

> Design it so any component can subscribe to input updates without changing the core handler.

---

### ⚡ Exercise 7: Event Loop with Timers

Create an event loop that:

* Accepts user input from the terminal
* Runs a repeating task every 5 seconds (e.g., printing system time)
* Does **not block** when waiting for input

> Combine scheduled tasks with external input handling in a single non-blocking loop.

---

### ⚡ Exercise 8: TCP Echo Server

Implement a TCP server that:

* Listens on port 1234
* Accepts multiple clients simultaneously
* Reads each client's input and echoes it back
* Prints when clients connect or disconnect

> Handle multiple sockets in one thread without blocking on any of them.

---

### ⚡ Exercise 9: File Watcher

Watch a text file (`status.txt`) and:

* Print a message when its last-modified time changes
* Poll every 2 seconds
* Support tracking multiple files

> Build a loop that can monitor changes over time efficiently.

---

### ⚡ Exercise 10: State Change Broadcaster

You're building a system that tracks device states (`:on`, `:off`, `:error`):

* When the state changes, the following should happen:

  * Write the new state to a log file
  * Send the state to a remote system
  * Print the state to the console

> Allow additional systems to be notified of state changes dynamically.

---

## 🔧 **Exercise: Reactor-style I/O Manager in Ruby**

### 🧠 **Goal:**

Build an event loop that:

* Monitors multiple IO objects (e.g., STDIN or sockets)
* Dispatches read/write callbacks when I/O is ready
* Supports timers and periodic tasks

---

## 📜 Step-by-Step Specification

### 1. **Create a `Reactor` class**

Your `Reactor` should:

* Register readable IO with a callback
* Support one-time or repeating timers
* Run an event loop using `IO.select`

```ruby
class Reactor
  def initialize
    @readers = {}
    @timers = []
  end

  def on_read(io, &callback)
    @readers[io] = callback
  end

  def after(seconds, &callback)
    @timers << { at: Time.now + seconds, repeat: false, callback: callback }
  end

  def every(seconds, &callback)
    @timers << { at: Time.now + seconds, repeat: seconds, callback: callback }
  end

  def run
    loop do
      run_timers
      ready = IO.select(@readers.keys, nil, nil, next_timer_wait)

      if ready
        readable = ready[0]
        readable.each do |io|
          @readers[io].call(io)
        end
      end
    end
  end

  private

  def run_timers
    now = Time.now
    @timers.select { |t| t[:at] <= now }.each do |t|
      t[:callback].call
      if t[:repeat]
        t[:at] = now + t[:repeat]
      else
        @timers.delete(t)
      end
    end
  end

  def next_timer_wait
    return 1 if @timers.empty?
    wait = @timers.map { |t| t[:at] - Time.now }.min
    wait.negative? ? 0 : wait
  end
end
```

---

## 🔌 **Sample Usage**

```ruby
reactor = Reactor.new

reactor.on_read($stdin) do |io|
  input = io.gets&.chomp
  if input == "exit"
    puts "Exiting..."
    exit
  else
    puts "You typed: #{input.inspect}"
  end
end

reactor.every(2) do
  puts "Heartbeat: #{Time.now}"
end

reactor.run
```

---

## ✅ Expected Output

* Every 2 seconds, "Heartbeat: ..." is printed.
* If user types into STDIN, it echoes.
* Typing `exit` exits the program.

---

## 🧪 **Bonus Challenges**

1. **Write support**:

   * Add `on_write(io, &block)` to handle writable IO (use `IO.select(read, write)`).

2. **Error handling**:

   * Handle cases where IO is closed or unreadable.

3. **Non-blocking TCP server**:

   * Use `TCPServer` to accept new clients.
   * Echo messages back from connected sockets.

4. **Replace IO.select with Epoll/Kqueue** (platform-dependent).

---

## 🔋 Embedded Use Case Tip

This approach works **without threads**, fits well in:

* CLI tools
* MRuby apps
* Low-resource daemons
* Embedded control loops
