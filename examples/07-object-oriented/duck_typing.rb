def display(some)
  # if String === some # Even sub classes will return true
  # if some.instance_of?(String) # Object was created as a String
  if some.respond_to?(:to_s)
    puts some.to_s
  else
    puts "Display is not supported on this type: #{some.class}"
  end
end

display(12)
display("Hello, World")

class MyString < String
end

s = MyString.new("MyString")

display(s)
