# 🧪 **Metaprogramming & DSL Exercises**

## 🥉 **Level 1 – Basics**

### 1. Dynamic attribute store with `method_missing`

**Task**:
Implement a class `OpenStructLike` that supports:

```ruby
obj = OpenStructLike.new
obj.name = "Router"
obj.ip = "192.168.0.1"
puts obj.name  # => "Router"
puts obj.ip    # => "192.168.0.1"
```

> ✅ Use only `method_missing`, `respond_to_missing?`, and an internal hash.

---

### 2. Auto-define methods with `define_method`

**Task**:
Create a class `Configurable` that takes a list of allowed attributes and generates setter/getter methods:

```ruby
Configurable.define_fields :hostname, :ip, :gateway

cfg = Configurable.new
cfg.hostname = "switch1"
cfg.ip = "10.0.0.1"
puts cfg.gateway  # => nil
```

> ✅ Use `define_method`, `instance_variable_get`, `instance_variable_set`.

---

### 3. Use `class_eval` to define static methods

**Task**:
Build a class `CommandRegistry` with:

```ruby
CommandRegistry.register :ping do |host|
  "Pinging #{host}"
end

puts CommandRegistry.new.ping("8.8.8.8")  # => "Pinging 8.8.8.8"
```

> ✅ Store lambdas in a hash, then use `class_eval` to define actual methods.

---

## 🥈 **Level 2 – Embedded Config DSLs**

### 4. Block-based config DSL with `method_missing`

**Task**:
Create a class `AppConfig` with:

```ruby
AppConfig.configure do
  name "Firewall"
  log_level "debug"
  enable_tls true
end

puts AppConfig.config
# => { name: "Firewall", log_level: "debug", enable_tls: true }
```

> ✅ Use `instance_eval` and `method_missing` inside `.configure`.

---

### 5. Safer DSL with `define_method` + `class_eval`

**Task**:
Whitelist config keys:

```ruby
ServerConfig.setting :port
ServerConfig.setting :max_clients
ServerConfig.setting :ssl

ServerConfig.configure do
  port 443
  max_clients 100
end
```

> ✅ Use `define_method` to prevent silent typos.

---

## 🥇 **Level 3 – Full DSL: Device/Network Configuration**

### 6. Write a complete DSL for device configuration

```ruby
DeviceConfig.configure do
  device "router1" do
    ip "192.168.1.1"
    role "gateway"
  end

  device "switch1" do
    ip "192.168.1.2"
    ports 24
  end
end

DeviceConfig.devices["router1"][:role] # => "gateway"
```

### 🔧 Requirements:

* `DeviceConfig.configure(&block)` uses `instance_eval`
* Inside `device(name) { ... }`, collect config into a hash
* Use `method_missing` or `define_method` to capture inner settings
* Result should be a hash like:

```ruby
{
  "router1" => { ip: "192.168.1.1", role: "gateway" },
  "switch1" => { ip: "192.168.1.2", ports: 24 }
}
```
