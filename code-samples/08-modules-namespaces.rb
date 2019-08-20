require 'pry'
require 'require_all'

# def require_all(_dir)
#   Dir[File.expand_path(File.join(File.dirname(File.absolute_path(__FILE__)), _dir)) + "/**/*.rb"].each do |file|
#       require file
#   end
# end

require_all './core_extensions'

# require './core_extensions/array'
# require './core_extensions/hash'

arr = CoreExtensions::Array.new([1, 2, 3])

binding.pry
