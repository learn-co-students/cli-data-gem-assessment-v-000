class EpicRoadTrips::CLI

  def call
    list_road_trips
  end

  def list_road_trips
    puts "Let's go on an EPIC Road Trip!"
    @@all = EpicRoadTrips::Trips
    @@all.each.with_index(1) do |trip, i|
      puts "#{i}. #{trip.road}"
    end
  end

  def 
end
