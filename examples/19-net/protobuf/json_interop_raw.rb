require 'google/protobuf'

json = Google::Protobuf::Struct.new(fields: {
  "id" => Google::Protobuf::Value.new(string_value: "xyz"),
  "count" => Google::Protobuf::Value.new(number_value: 42)
})

# Serialize
json_bytes = Google::Protobuf::Struct.encode(json)
parsed = Google::Protobuf::Struct.decode(json_bytes)
puts parsed
