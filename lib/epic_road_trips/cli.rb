class EpicRoadTrips::CLI

  def call
    puts ""
    puts "--*-- Welcome World Traveler! --*--"
    puts ""
    puts ">> Let's go on an EPIC Road Trip! <<"
    list_road_trips
    menu
    goodbye
  end

  def list_road_trips
    puts ""
    @trips = EpicRoadTrips::Trips.get_page
    @trips.each_with_index do |trip, i|
      puts "#{trip.road}"
    end
  end

  def list_descriptions
    puts ""
    EpicRoadTrips::Trips.all.each.with_index(1) do |trip, i|
      puts "#{trip.description}"
    end
  end

  def menu
    input = nil
    while input != "adios"
      puts ""
      puts "Enter the number of the roadtrip you'd like more info on"
      puts ""
      puts "Enter 'list' to see all EPIC road trips"
      puts "Enter 'adios' to exit program."
      puts ""
      input = gets.strip

      if input.to_i > 0
        trip = @trips[input.to_i-1]

        puts "#{trip.road}"
        puts "#{trip.description}"
      elsif input == "list"
        list_road_trips
       end
     end
    end

  def goodbye
    puts ""
    puts "See you next time for your next EPIC road trip!"
  end

  def road_trip_1
    puts ">> Wild Atlantic Way <<"
  end
end
