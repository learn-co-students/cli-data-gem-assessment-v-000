require 'pry'
require 'nokogiri'
require 'open-uri'

module EpicRoadTrips

class EpicRoadTrips::Trips
  attr_accessor :road, :highlight


  #def initialize(road = nil, description = nil)
    #@road = road
    #@description = description
  #end

  #def self.all
    #@@all
  #end


  def self.get_page
      trips = []

      doc = Nokogiri::HTML(open("https://theplanetd.com/best-road-trips/"))

      list_trips = doc.css(".entry")
      list_trips.each do |road_trip|
        trip_name = road_trip.css("h2").text.gsub("\u2013", "").gsub("\u00A0", "").split("#")
        trip_highlights = road_trip.css("blockquote").text.gsub("\u2013", "").split("\u00A0") #splits some, not sure if this is possible or will correspond with correct trip 
        i = 0
        trip_name.each do |name|
          trip = self.new
          binding.pry
          trip.road = name
          trip.highlight = trip_highlights[i]
          i += 1
        end
          trips << trip # trip method error
        end
        trips
      end
    end
  end

EpicRoadTrips::Trips.get_page


#If I change to list_trips = doc.css(".entry h2")
# list_trips.each do |road_trip|
  #trip = self.new
  #trip.road = road_trip.css("span")text
# => It outputs ALL the roadtrips in CLI 1-16 - BUT no descriptions

# doc.css("blockquote").text - returns all highlights, trying to iterate through this instead of "p"
# If I iterate through -  for trips and highlights I was getting a long string for each - how
# do I separate the strings into the objects?


#Using a while loops to iterate through

# doc.css(".entry h2").each do |road_trip|
#  trips = road_trip.text
# end


# doc.css (".entry blockquote").each do |road_trip|
#  highlights = road_trip.text
# end
