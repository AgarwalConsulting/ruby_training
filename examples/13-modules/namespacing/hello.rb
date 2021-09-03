module Japanese
  class Greeter
    def greeting
      "Sayonara"
    end
  end

  class SpellChecker
  end
end

module English
  class Greeter
    def initialize(greeting)
      @greeting = greeting
    end

    def greeting(name)
      @greeting + ", " + name
    end
  end

  module Grammar
    class Checker

    end
  end
end

# puts greeting "Gaurav"

puts English::Greeter.new("Hello").greeting "Gaurav"
puts Japanese::Greeter.new.greeting


puts English::Grammar::Checker.new
