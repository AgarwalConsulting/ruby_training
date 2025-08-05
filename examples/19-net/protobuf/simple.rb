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

# ---
## JSON Interop
# require 'json'
# json_data = reading.to_h.to_json
# rebuilt = SensorReading.new(JSON.parse(json_data))
# ---

# ---
## Size Comparison with JSON
# require 'json'
# json_size = reading.to_h.to_json.bytesize
# protobuf_size = SensorReading.encode(reading).bytesize

# puts "JSON: #{json_size} bytes, Protobuf: #{protobuf_size} bytes"
# ---
