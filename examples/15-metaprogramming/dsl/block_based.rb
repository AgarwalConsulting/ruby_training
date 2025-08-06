class Server
  attr_reader :settings

  def initialize(name, &block)
    @settings = { name: name }
    instance_eval(&block) if block_given?
  end

  def ip(value)
    @settings[:ip] = value
  end

  def role(value)
    @settings[:role] = value
  end
end

class Network
  attr_reader :devices

  def initialize(&block)
    @devices = {}
    instance_eval(&block)
  end

  def device(name, &block)
    @devices[name] = Server.new(name, &block).settings
  end
end

# DSL usage
net = Network.new do
  device "router" do
    ip "10.0.0.1"
    role "gateway"
  end

  device "switch" do
    ip "10.0.0.2"
    role "access"
  end
end

puts net.devices["router"]
# => {:name=>"router", :ip=>"10.0.0.1", :role=>"gateway"}
