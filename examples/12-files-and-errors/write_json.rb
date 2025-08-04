require 'json'

# class Person
#   attr_accessor :name, :age
# end

# p = Person.new()
# p.name = "Gaurav"
# p.age = 34

p = {:name => "Gaurav", :age => 34}

# puts p.to_json
# puts JSON::generate(p)

begin
  f = File.new('/tmp/person.json', File::RDWR, 0744, :flags => File::Constants::CREAT | File::Constants::APPEND)

  # puts f.gets
  f.puts JSON::generate(p)
rescue Errno::ENOENT => e
  puts "File not found, #{e}"
end
