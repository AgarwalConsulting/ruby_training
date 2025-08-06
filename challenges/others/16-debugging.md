# Debugging Exercise

## 🧪 **Exercise: Debug a Failing Ruby Daemon on an Emulated Board**

### 🧾 **Scenario**

You’re SSHed into an emulated ARM Linux board. A Ruby daemon (`sensor_daemon.rb`) is crashing intermittently with no logs. Your job is to debug and fix it using only terminal tools (no GUI).

---

### 📁 File: `sensor_daemon.rb`

```ruby
#!/usr/bin/env ruby
require 'logger'

$log = Logger.new('/tmp/sensor_daemon.log')

def read_sensor
  File.read('/sys/devices/virtual/sensor0/value').to_i
end

def start_daemon
  $log.info "Sensor Daemon started (PID: #{Process.pid})"
  loop do
    begin
      val = read_sensor
      $log.info "Sensor value: #{val}"
      raise "Sensor overload" if val > 800
      sleep 2
    rescue => e
      $log.error("Error: #{e.message}")
      $log.error(e.backtrace.join("\n"))
      # simulate crash
      exit 1
    end
  end
end

start_daemon
```

---

## ✅ **Goal**

1. Find the cause of the crash.
2. Prevent it from crashing on error.
3. Add a debugger hook (optional).
4. Bonus: Run it as a background service and monitor it.

---

## 🧰 **Tools Allowed**

* `puts`, `logger`
* `debug`, `binding.break`
* `tail -f /tmp/sensor_daemon.log`
* `systemd` or `nohup` (optional)
* `rdbg --open` (optional for remote host debugging)

---

## ✅ **Step-by-Step Exercise**

### 🪵 Step 1: Run the daemon

```sh
ruby sensor_daemon.rb
```

Observe it crashing. Look at logs:

```sh
tail -f /tmp/sensor_daemon.log
```

---

### 🔍 Step 2: Debug with `puts` or `logger`

Modify:

```ruby
def read_sensor
  puts "Reading sensor..."
  File.read('/sys/devices/virtual/sensor0/value').to_i
end
```

If the file is missing, catch `Errno::ENOENT`.

---

### 🐞 Step 3: Use `debug`

```ruby
require 'debug'

def read_sensor
  val = File.read('/sys/devices/virtual/sensor0/value').to_i
  binding.break if val > 800
  val
end
```

This lets you inspect variables when the sensor misbehaves.

---

### 🧯 Step 4: Prevent crash

Instead of `exit 1`, just continue or retry:

```ruby
rescue => e
  $log.error("Recoverable error: #{e.message}")
  sleep 5
  retry
end
```

---

### ⚙️ Step 5 (Bonus): Run as a systemd or background service

```ini
# /etc/systemd/system/sensor_daemon.service
[Unit]
Description=Sensor Ruby Daemon

[Service]
ExecStart=/usr/bin/env ruby /home/pi/sensor_daemon.rb
Restart=always
StandardOutput=file:/tmp/sensor_daemon_stdout.log
StandardError=file:/tmp/sensor_daemon_stderr.log

[Install]
WantedBy=multi-user.target
```

Or for quick test:

```sh
nohup ruby sensor_daemon.rb &
```

---

### 🚨 Step 6 (Bonus): Remote Debug via Host

If using QEMU or port forwarding:

```sh
rdbg --open --port=12345 sensor_daemon.rb
```

Then from host:

```sh
rdbg --attach <emulator_ip>:12345
```

---

## ✅ **Deliverables**

* ✅ Modified script with retry/backoff logic
* ✅ Captured logs
* ✅ Short postmortem: root cause + fix
