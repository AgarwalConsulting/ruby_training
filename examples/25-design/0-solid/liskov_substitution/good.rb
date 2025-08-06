class Shape
  def area
    raise NotImplementedError
  end
end

class Square < Shape
  def area
    5 * 5
  end
end

class Circle < Shape
  def area
    Math::PI * 3**2
  end
end

# usage
def print_area(shape)
  puts shape.area
end
