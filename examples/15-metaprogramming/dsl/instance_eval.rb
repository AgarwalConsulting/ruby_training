class Config
  def initialize
    @settings = {}
  end

  def set(key, value)
    @settings[key] = value
  end

  def settings
    @settings
  end
end

class App
  def self.configure(&block)
    config = Config.new
    config.instance_eval(&block)  # ← context switch!
    @settings = config.settings
  end

  def self.settings
    @settings
  end
end

# DSL usage
App.configure do
  set :name, "MyApp"
  set :port, 3000
end

puts App.settings
# => {:name=>"MyApp", :port=>3000}
