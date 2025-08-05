# 🔁 **Common Task**: Make 3 HTTP GET requests in parallel, then print the response sizes

Target URL (fast and predictable):
`https://httpbin.org/delay/1` — responds in 1 second.

---

## ✅ **1. Threads Version** (Preemptive)

```ruby
require 'net/http'
require 'uri'

urls = Array.new(3, 'https://httpbin.org/delay/1')

threads = urls.map.with_index do |url, i|
  Thread.new do
    puts "Thread #{i} starting"
    res = Net::HTTP.get(URI(url))
    puts "Thread #{i} got #{res.bytesize} bytes"
  end
end

threads.each(&:join)
```

---

## ✅ **2. Fibers Version** (Manual)

This shows how *not* to do it for real work — it's a manual cooperative version for learning:

```ruby
require 'fiber'
require 'net/http'
require 'uri'

def fetch(url)
  Fiber.new do
    puts "Fetching #{url}"
    res = Net::HTTP.get(URI(url))
    puts "Got #{res.bytesize} bytes"
  end
end

fibers = Array.new(3) { fetch('https://httpbin.org/delay/1') }

# Run fibers one at a time manually — no concurrency
fibers.each(&:resume)
```

⚠️ **Note**: This version is **sequential**, as `Net::HTTP.get` blocks and we have no scheduler. Real concurrency with fibers needs async I/O.

---

## ✅ **3. EventMachine Version** (Callback-based)

```ruby
require 'eventmachine'
require 'em-http-request'

urls = Array.new(3, 'https://httpbin.org/delay/1')

EM.run do
  remaining = urls.size

  urls.each_with_index do |url, i|
    http = EM::HttpRequest.new(url).get

    http.callback do
      puts "Request #{i} got #{http.response.bytesize} bytes"
      remaining -= 1
      EM.stop if remaining.zero?
    end

    http.errback do
      puts "Request #{i} failed"
      remaining -= 1
      EM.stop if remaining.zero?
    end
  end
end
```

🧪 Requires:

```bash
gem install eventmachine em-http-request
```

---

## ✅ **4. async Gem Version** (Modern, Structured)

```ruby
require 'async'
require 'async/http/internet'

Async do
  internet = Async::HTTP::Internet.new

  3.times.map do |i|
    Async do
      response = internet.get("https://httpbin.org/delay/1")
      body = response.read
      puts "Fiber #{i} got #{body.bytesize} bytes"
    end
  end
ensure
  internet.close
end
```

🧪 Requires:

```bash
gem install async async-http
```
