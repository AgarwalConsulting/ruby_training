# Web Server & Protobuf exercises

## 🛠️ **Exercise: Embedded Config Server using Protobuf over HTTP**

### 🎯 Goal:

Build a tiny service to **push** and **pull** configuration files (key-value settings) between clients and server, serialized with **Protocol Buffers** over **HTTP**, all in **vanilla Ruby**.

---

## 📁 Project Structure

```
config_server/
├── config.proto
├── config_pb.rb          # generated
├── server.rb             # WEBrick-based service
└── client.rb             # Net::HTTP client
```

---

## 📜 `config.proto`

```proto
syntax = "proto3";

message Config {
  string client_id = 1;
  map<string, string> settings = 2;
}
```

---

## ▶️ Step 1: Generate Ruby Code

```sh
protoc --ruby_out=. config.proto
```

This creates `config_pb.rb`.

---

## 🖥️ Step 2: WEBrick Server – `server.rb`

```ruby
require 'webrick'
require_relative './config_pb'

$CONFIG_STORE = {}

class ConfigServlet < WEBrick::HTTPServlet::AbstractServlet
  def do_POST(req, res)
    begin
      config = Config.decode(req.body)
      $CONFIG_STORE[config.client_id] = config.settings

      puts "[STORE] #{config.client_id} -> #{config.settings.inspect}"

      res.status = 200
      res['Content-Type'] = 'text/plain'
      res.body = "OK"
    rescue => e
      res.status = 400
      res.body = "Error: #{e.message}"
    end
  end

  def do_GET(req, res)
    client_id = req.query["id"]

    unless $CONFIG_STORE.key?(client_id)
      res.status = 404
      res.body = "No config for #{client_id}"
      return
    end

    config = Config.new(
      client_id: client_id,
      settings: $CONFIG_STORE[client_id]
    )

    res.status = 200
    res['Content-Type'] = 'application/x-protobuf'
    res.body = Config.encode(config)
  end
end

server = WEBrick::HTTPServer.new(Port: 8080, Logger: nil, AccessLog: [])
server.mount "/config", ConfigServlet
trap("INT") { server.shutdown }
puts ">> Config server running on http://localhost:8080"
server.start
```

---

## 🧑‍💻 Step 3: Client – `client.rb`

```ruby
require 'net/http'
require 'uri'
require_relative './config_pb'

def push_config(client_id, kv)
  uri = URI("http://localhost:8080/config")

  config = Config.new(client_id: client_id, settings: kv)

  req = Net::HTTP::Post.new(uri)
  req.body = Config.encode(config)
  req['Content-Type'] = 'application/x-protobuf'

  res = Net::HTTP.start(uri.hostname, uri.port) { |http| http.request(req) }
  puts "Push response: #{res.code} - #{res.body}"
end

def pull_config(client_id)
  uri = URI("http://localhost:8080/config?id=#{client_id}")

  res = Net::HTTP.get_response(uri)

  if res.code == "200"
    config = Config.decode(res.body)
    puts "Pulled config for #{config.client_id}:"
    config.settings.each { |k, v| puts "  #{k} => #{v}" }
  else
    puts "Error: #{res.code} - #{res.body}"
  end
end

# Example usage
push_config("sensor-1", { "interval" => "10s", "mode" => "auto" })
sleep 0.5
pull_config("sensor-1")
```

---

## 🧪 Try It Out

```sh
ruby server.rb   # in one terminal
ruby client.rb   # in another
```

You’ll see:

```
Push response: 200 - OK
Pulled config for sensor-1:
  interval => 10s
  mode => auto
```
