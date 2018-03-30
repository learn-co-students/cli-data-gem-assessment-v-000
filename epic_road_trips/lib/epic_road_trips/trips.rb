class EpicRoadTrips::Trips
  attr_accessor :name, :position, :road, :country, :description

  def initialize(name = nil, position = nil, road = nil, country = nil, description = nil)
    @name = name
    @position = position
    @road = road
    @country = country
    @description = description
  end
end
