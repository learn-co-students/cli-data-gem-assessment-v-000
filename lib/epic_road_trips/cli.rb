class EpicRoadTrips::CLI

  def call
    greeting
    list_road_trips
    menu
    goodbye
  end

  def greeting
    puts ""
    puts "--*-- Welcome World Traveler! --*--"
    puts ""
    puts ">> Let's go on an EPIC Road Trip! <<"
    puts ""
  end

  def list_road_trips
    puts ""
    @trips = EpicRoadTrips::Trips.get_page
    @trips.each_with_index do |trip, i|
      puts "#{i+1}. #{trip.road} - #{trip.country}"
    end
  end

  def menu
    input = nil
    while input != "adios"
      puts ""
      puts "Enter the number of the roadtrip you'd like more info on"
      puts ""
      puts "Enter 'list' to see all EPIC road trips."
      puts "Enter 'adios' to exit program."
      input = gets.strip

      if input.to_i > 0
        trip = @trips[input.to_i-1]

        puts "-------- >> #{trip.road} - #{trip.country} << -------- "
        puts ""
        puts "-------*-------*-------*-------*-------*-------*-------*------- "
        puts ""
        puts "#{trip.description}"
        puts ""
      elsif input == "list"
          list_road_trips
      end
    end
  end

  def goodbye
    puts ""
    puts "See you next time for your next EPIC road trip!"
  end
end
