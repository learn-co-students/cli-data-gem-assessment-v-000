require 'pry'
require 'nokogiri'
require 'open-uri'

module EpicRoadTrips

class EpicRoadTrips::Trips
    attr_accessor :road, :country, :description


  def self.get_page
      trips = []

       doc = Nokogiri::HTML(open("https://www.fodors.com/news/photos/the-20-best-road-trips-on-earth"))

       list_trips = doc.css(".container.slides")
       list_trips.each do |road_trip|
         trip = self.new
         trip.road = road_trip.css("h2").text.strip.gsub("\n", "").gsub("Book a Hotel", "")
         trip.country = road_trip.css("h3 span").text.strip.gsub("\n", "")
         trip.description = road_trip.css("p").text.gsub("\u2019", " ").gsub("\u00A0", " ")

         trips << trip

         end
         trips
       end
     end
   end
