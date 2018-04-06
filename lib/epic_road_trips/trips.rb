require 'pry'
require 'nokogiri'
require 'open-uri'

module EpicRoadTrips

class EpicRoadTrips::Trips
  attr_accessor :road, :description

  @@all = []

  def initialize(road = nil, description = nil)
    @road = road
    @description = description
  end

  def self.all
    @@all
  end


  def self.get_page
    doc = Nokogiri::HTML(open("https://theplanetd.com/best-road-trips/"))


    doc.css(".entry h2").each do |road_trip|
        trip = self.new
        trip.road = road_trip.css("span").text
        #trip.description = road_trip.css("p").text
        @@all << trip

        #binding.pry


      end
    end
  end
end

EpicRoadTrips::Trips.get_page

# .gsub("#2", "")

# doc.css(".row h2")[0].text
  # => "1. Cabot Trail, Canada"

# doc.css(".row h2")[1].text
  # => "2. The Garden Route, South Africa"

# doc.css(".row h2")[2].text
  # => "3. Colombia River Gorge, USA"

# doc.css(".row h2")[3].text
  # => "4. San Juan Skyway,\u00A0USA"
# doc.css (".row p").text
