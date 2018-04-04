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
    EpicRoadTrips::Trips.all.each.with_index(1) do |trip, i|
      puts "#{i}. #{trip.road}"
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
      input = gets.strip.downcase

      if input.to_i > 0
        trips = @all[input.to_i-1]
        puts "#{trips.road} - #{trips.description}"
      elsif input == "list"
        list_road_trips
      else
        puts "Hmm, I didn't catch that. Please enter 'list' or 'adios'."
       end
     end
    end

  def goodbye
    puts "See you next time for your next EPIC road trip!"
  end
end
