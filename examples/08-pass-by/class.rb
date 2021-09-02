class Coordinates
  attr_accessor :lat, :long
  def initialize(lat, long)
    @lat = lat
    @long = long
    # self.lat = lat
    # self.long = long
  end
end

def update(point, lat, long)
  point = Coordinates.new(lat, long)
  # point.lat = lat
  # point.long = long
end

point = Coordinates.new(12.12, 10.2512)

pp point

update(point, 45.12, 76.12)

pp point #
