# Ruby metaprogramming enables building elegant DSLs.

class Config
  def self.setup(&block)
    instance_eval(&block)
  end

  def self.set(key, value)
    puts "#{key} = #{value}"
  end
end

Config.setup do
  set :timeout, 30
  set :retries, 3
end
