require 'pry'
require 'nokogiri'
require 'open-uri'

module EpicRoadTrips

class EpicRoadTrips::Trips
  attr_accessor :road, :description


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
        trip = self.new
        trip.road = road_trip.css("h2").children[0].text
        trip.description = road_trip.css("p").children[8].text
        trips << trip

        #binding.pry

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
