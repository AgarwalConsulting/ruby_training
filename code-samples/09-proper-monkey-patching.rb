require 'pry'

require_relative './array_extensions'

class Array
  include ArrayExtensions
end

binding.pry
