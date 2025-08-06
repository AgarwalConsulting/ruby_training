# Provides a placeholder to control access.

class Image
  def display = puts "Displaying image"
end

class LazyImageProxy
  def initialize
    @image = nil
  end

  def display
    @image ||= Image.new
    @image.display
  end
end
