def deep_freeze(obj)
  case obj
  when Array
    obj.each { |item| deep_freeze(item) }
  when Hash
    obj.each { |k, v| deep_freeze(k); deep_freeze(v) }
  end
  obj.freeze
end

data = {
  name: "Ruby",
  features: ["GC", "Dynamic", "Object-Oriented"],
  versions: { major: 3, minor: 2 }
}

deep_freeze(data)

data[:features] << "Immutable"  # => FrozenError
