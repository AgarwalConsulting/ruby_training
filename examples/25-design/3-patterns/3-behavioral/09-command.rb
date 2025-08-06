# Encapsulates a request as an object.

class Light
  def on = puts "Light ON"
  def off = puts "Light OFF"
end

class OnCommand
  def initialize(light); @light = light; end
  def execute; @light.on; end
end

class OffCommand
  def initialize(light); @light = light; end
  def execute; @light.off; end
end
