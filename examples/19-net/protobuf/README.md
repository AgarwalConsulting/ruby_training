# Working with protobuf

## 🔧 Setup

```sh
gem install google-protobuf
brew install protobuf  # or `apt install protobuf-compiler`
```

### On Windows

- Download Windows [release](https://github.com/protocolbuffers/protobuf/releases)

- Choose the `protoc-<version>-win64.zip` or `win32.zip` as per your system.

- Extract and add the `bin/` folder to your system `PATH`.

- Test it:

```powershell
protoc --version
# => libprotoc 3.x.x
```

## 🔹 Step-by-Step

### 1. Define Your `.proto`

```proto
// message.proto
syntax = "proto3";

message SensorReading {
  string sensor_id = 1;
  float value = 2;
  int64 timestamp = 3;
}
```

### 2. Compile to Ruby

```sh
protoc --ruby_out=. message.proto
```

This creates `message_pb.rb` containing:

```ruby
# auto-generated
class SensorReading < ::Google::Protobuf::Message
  optional :sensor_id, :string, 1
  optional :value, :float, 2
  optional :timestamp, :int64, 3
end
```

### 3. Use in Ruby

```ruby
require './message_pb'

reading = SensorReading.new(
  sensor_id: "temp-001",
  value: 24.5,
  timestamp: Time.now.to_i
)

binary_data = SensorReading.encode(reading)
puts "Encoded size: #{binary_data.bytesize} bytes"

decoded = SensorReading.decode(binary_data)
puts "Decoded: #{decoded.sensor_id} => #{decoded.value} @ #{Time.at(decoded.timestamp)}"
```
