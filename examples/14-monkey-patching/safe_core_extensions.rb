require 'pry'

module CoreExtensions
  module String
    def blank?
      self.strip.empty?
    end

    def to_arr
      res = []
      for el in self.each_char
        res << el
      end

      res
    end

    def upcase
      self[0] = "C"
      self
    end
  end
end

String.include CoreExtensions::String

binding.pry
