class MyModel
  [:name, :email, :age].each do |attr|
    define_method(attr) do
      instance_variable_get("@#{attr}")
    end

    define_method("#{attr}=") do |value|
      instance_variable_set("@#{attr}", value)
    end
  end
end

user = MyModel.new
user.name = "Alice"
puts user.name  # => "Alice"
