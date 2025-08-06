module Bird
  def fly; end
  def swim; end
end

class Penguin
  include Bird

  def fly
    raise "Penguins can't fly"
  end
end
