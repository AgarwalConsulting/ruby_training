require 'pry'
class DynamicAttributes
  def initialize
    @attributes = {}
  end

  def method_missing(name, *args)
    attr = name.to_s # name=
    if attr.end_with?("=") # Setter
      self.class.define_method(name) do |val|
        puts "Invoking dynamic method..."
        @attributes[attr.chop.to_sym] = val
      end
      self.send(name, *args)
    else
      @attributes[attr.to_sym]
    end
  end

  def respond_to_missing?(method, include_private = false)
    true
  end
end

obj = DynamicAttributes.new
obj.name = "Ruby"
puts obj.name   # => "Ruby"

p obj.respond_to?(:name)

binding.pry
