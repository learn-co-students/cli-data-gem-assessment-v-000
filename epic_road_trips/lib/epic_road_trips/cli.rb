class EpicRoadTrip::CLI

  def call
    list_road_trips
    menu
    adios
  end

  def list_road_trips
     puts "Let's go on an EPIC Road Trip!"
     @road_trips = EpicRoadTrips::Trips.new (????)
    #scraped list
  end
