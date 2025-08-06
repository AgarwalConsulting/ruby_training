# 🧪 Exercise: Build a Network Device Configuration DSL

## ✅ Goal

Create a **DSL in pure Ruby** that lets users configure network devices and VLANs using a natural, block-based syntax with method chaining.

---

## 🛰️ Target DSL Syntax

```ruby
net = Network.new do
  device "router1" do
    ip "192.168.1.1"
    role "gateway"
    location "datacenter-1"
  end

  device "switch1" do
    ip "192.168.1.2"
    ports 48
    location "floor-2"
  end

  vlan(10).name("staff").gateway("192.168.10.1")
  vlan(20).name("guests").gateway("192.168.20.1")
end

puts net.devices["router1"]
# => {:name=>"router1", :ip=>"192.168.1.1", :role=>"gateway", :location=>"datacenter-1"}

puts net.vlans[10]
# => {:id=>10, :name=>"staff", :gateway=>"192.168.10.1"}
```

---

## 🛠️ Requirements

### 1. **Block-based device configuration**

* Devices should be defined using a `device(name) do ... end` syntax.
* Each device should collect its settings into a hash.
* Allow any arbitrary keys inside the block (e.g. `ip`, `role`, `location`).

> ✅ Tip: Use `instance_eval` and `method_missing`.

---

### 2. **Fluent VLAN definitions**

* Allow defining VLANs like:

  ```ruby
  vlan(10).name("staff").gateway("192.168.10.1")
  ```
* Each VLAN should support method chaining and store values in a hash.

> ✅ Tip: Have `name` and `gateway` return `self`.

---

### 3. **Expose data as hash**

* `Network#devices` should be a hash mapping device name to config hash.
* `Network#vlans` should be a hash mapping VLAN id to config hash.

---

## 🚧 Bonus Challenges

Try any (or all) of these for extra learning:

1. **Validations**: Raise an error if an IP is invalid (`192.168.x.x`).
2. **Nested blocks**: Allow credentials block like:

   ```ruby
   device "router1" do
     ip "..."
     credentials do
       user "admin"
       pass "secret"
     end
   end
   ```
3. **Export to YAML or JSON**.
4. **Support for interfaces** inside devices.

---

## 📦 Deliverables

Implement the following classes:

* `Network`
* `Device`
* `VLAN`

Each should be a minimal, single-purpose class using:

| Technique                  | Where to apply                    |
| -------------------------- | --------------------------------- |
| `instance_eval`            | `Network`, `Device` block parsing |
| `method_missing`           | Free-form device keys             |
| `define_method` (optional) | If you want to whitelist keys     |
| `return self`              | For VLAN chaining                 |
