require 'yaml'

# f = File.open('/tmp/config.yaml')
#

# File.open('/tmp/config.yaml') do |f|
#   content = f.read
#   puts content
# end

content = File.read('/tmp/config.yaml')
puts content

h = YAML.load(content)

puts h["polling"]
