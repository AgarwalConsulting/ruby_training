class DynamicAttributes
  def initialize
    @attributes = {}
  end

  def method_missing(name, *args)
    attr = name.to_s
    if attr.end_with?("=")
      @attributes[attr.chop.to_sym] = args.first
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
